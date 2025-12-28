import 'package:isar/isar.dart';

part 'email_sender_preference_model.g.dart';

@collection
class EmailSenderPreferenceModel {
  Id id;

  /// Email address of the sender
  @Index(unique: true)
  String senderEmail;

  /// Domain of the sender (e.g., "amazon.com")
  @Index()
  String senderDomain;

  /// Display name of the sender
  String? senderDisplayName;

  /// Whether to scan emails from this sender
  bool scanEnabled;

  /// Last time we scanned emails from this sender
  DateTime? lastScannedDate;

  /// Total emails processed from this sender
  int totalEmailsProcessed;

  /// Total transactions extracted from this sender
  int totalTransactionsExtracted;

  /// Average confidence score for this sender's emails
  double? averageConfidence;

  /// Whether this sender is recognized as a merchant
  bool isRecognizedMerchant;

  /// User notes about this sender
  String? userNotes;

  @Index()
  DateTime createdAt;

  DateTime? updatedAt;

  EmailSenderPreferenceModel({
    this.id = Isar.autoIncrement,
    required this.senderEmail,
    required this.senderDomain,
    this.senderDisplayName,
    this.scanEnabled = true,
    this.lastScannedDate,
    this.totalEmailsProcessed = 0,
    this.totalTransactionsExtracted = 0,
    this.averageConfidence,
    this.isRecognizedMerchant = false,
    this.userNotes,
    required this.createdAt,
    this.updatedAt,
  });
}
