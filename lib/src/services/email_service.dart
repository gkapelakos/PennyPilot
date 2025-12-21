import 'dart:convert';
import 'package:googleapis/gmail/v1.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:pennypilot/src/services/auth_service.dart';
import 'package:pennypilot/src/services/receipt_extraction_service.dart';
import 'package:pennypilot/src/services/subscription_intelligence_service.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/data/models/receipt_line_item_model.dart';

class EmailService {
  final AuthService _authService;
  final ReceiptExtractionService _receiptExtractionService;
  final SubscriptionIntelligenceService _subscriptionService;
  final Isar _isar;
  final _logger = Logger('EmailService');

  EmailService(
    this._authService,
    this._receiptExtractionService,
    this._subscriptionService,
    this._isar,
  );

  /// Scan connected email accounts for receipts and invoices
  Future<void> scanEmails() async {
    final emails = _authService.connectedEmails;
    if (emails.isEmpty) {
      _logger.warning('No connected email accounts to scan');
      return;
    }

    try {
      for (final email in emails) {
        await _scanAccount(email);
      }
      
      // After scanning all accounts, run subscription intelligence
      await _subscriptionService.detectSubscriptions();
      
    } catch (e, stack) {
      _logger.severe('Error scanning emails', e, stack);
      rethrow;
    }
  }

  Future<void> _scanAccount(String email) async {
    try {
      _logger.info('Scanning account: $email');
      final httpClient = await _authService.getClientForEmail(email);
      if (httpClient == null) {
        _logger.warning('Could not get authenticated client for $email');
        return;
      }

      final gmailApi = GmailApi(httpClient);
      
      String? nextPageToken;
      int processedCount = 0;
      
      // Calculate search cutoff (e.g. 6 months ago or last sync)
      // For now using fixed date from requirements/prompt suggestions
      // but ideally we should track last sync date per account.
      // Using a reasonable default:
      final query = 'subject:(receipt OR invoice OR subscription OR order) -in:trash -in:spam after:2024/01/01';

      do {
        final response = await gmailApi.users.messages.list(
          'me', 
          q: query, 
          pageToken: nextPageToken,
          maxResults: 20 // Batch size
        );
        
        nextPageToken = response.nextPageToken;
        
        if (response.messages == null || response.messages!.isEmpty) {
           break;
        }
        
        for (final msgHeader in response.messages!) {
          // Check if already processed
          final existing = await _isar.transactionModels
              .filter()
              .originalEmailIdEqualTo(msgHeader.id)
              .findFirst();
              
          if (existing != null) {
            // Already processed, skip
            continue;
          }
          
          await _processMessage(gmailApi, msgHeader.id!);
          processedCount++;
        }
        
        // Safety break to prevent infinite loops during dev/testing
        if (processedCount > 100) {
           _logger.info('Reached limit of 100 processed emails for this run.');
           break;
        }
        
      } while (nextPageToken != null);
      
      _logger.info('Finished scanning $email. Processed $processedCount new emails.');

    } catch (e, stack) {
      _logger.severe('Error scanning email account: $email', e, stack);
    }
  }

  Future<void> _processMessage(GmailApi gmailApi, String messageId) async {
    try {
      final message = await gmailApi.users.messages.get(
        'me', 
        messageId, 
        format: 'full'
      );
      
      final subject = _getHeader(message, 'Subject') ?? 'Unknown Subject';
      final from = _getHeader(message, 'From') ?? 'Unknown Sender';
      final dateMillis = int.tryParse(message.internalDate ?? '0') ?? 0;
      final date = dateMillis > 0 
          ? DateTime.fromMillisecondsSinceEpoch(dateMillis) 
          : DateTime.now();
          
      final body = _extractBody(message);
      
      // Extract data
      final extraction = await _receiptExtractionService.extractReceiptData(
        emailBody: body,
        emailSubject: subject,
        emailSender: from,
        emailId: messageId,
      );
      
      // Filter out low confidence results unless they are very likely correct based on sender/subject
      if (extraction.overallConfidence == ConfidenceLevel.low && extraction.totalAmount == 0) {
        // Skip junk
        return;
      }
      
      // Create Transaction Model
      final transaction = TransactionModel()
        ..merchantName = extraction.merchantName
        ..rawMerchantName = extraction.rawMerchantName
        ..amount = extraction.totalAmount
        ..subtotalAmount = extraction.subtotalAmount
        ..taxAmount = extraction.taxAmount
        ..discountAmount = extraction.discountAmount
        ..tipAmount = extraction.tipAmount
        ..date = extraction.date.year == DateTime.now().year && extraction.date.month == DateTime.now().month && extraction.date.day == DateTime.now().day && dateMillis > 0
            ? date // Use email date if extraction failed to find a date in body
            : extraction.date
        ..category = null // To be categorized later
        ..origin = TransactionOrigin.emailDetected
        ..extractionConfidence = extraction.overallConfidence
        ..hasLineItems = extraction.hasLineItems
        ..originalEmailId = messageId
        ..createdAt = DateTime.now()
        ..userVerified = false;
        
      // Save to database
      await _isar.writeTxn(() async {
        await _isar.transactionModels.put(transaction);
        
        if (extraction.hasLineItems) {
           for (var item in extraction.lineItems) {
             final lineItem = ReceiptLineItemModel()
               ..description = item.description
               ..amount = item.amount
               ..type = item.type
               ..order = item.order
               ..transactionId = transaction.id;
             
             await _isar.receiptLineItemModels.put(lineItem);
           }
        }
      });
      
      _logger.info('Saved transaction: ${transaction.merchantName} - \$${transaction.amount}');
      
    } catch (e) {
      _logger.warning('Failed to process message $messageId', e);
    }
  }
  
  String? _getHeader(Message message, String name) {
    return message.payload?.headers?.firstWhere(
      (h) => h.name?.toLowerCase() == name.toLowerCase(),
      orElse: () => MessagePartHeader(name: name, value: null),
    ).value;
  }
  
  String _extractBody(Message message) {
    if (message.payload == null) return '';
    
    // First try to find text/plain
    String? body = _findPart(message.payload!, 'text/plain');
    if (body != null) return body;
    
    // Fallback to text/html
    body = _findPart(message.payload!, 'text/html');
    
    // TODO: Strip HTML tags if using HTML part
    // For now returning raw which might affect regex but usually regex ignores tags if simple
    // A proper HTML stripper would be good here.
    return body ?? '';
  }
  
  String? _findPart(MessagePart part, String mimeType) {
    if (part.mimeType == mimeType && part.body?.data != null) {
      try {
        return utf8.decode(base64.decode(base64Url.normalize(part.body!.data!)));
      } catch (e) {
        return null;
      }
    }
    
    if (part.parts != null) {
      for (final subPart in part.parts!) {
        final result = _findPart(subPart, mimeType);
        if (result != null) return result;
      }
    }
    return null;
  }

  Future<void> signIn() async {
    await _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}

