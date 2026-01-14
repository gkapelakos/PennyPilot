import 'dart:io';
import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DataExportService {
  final Isar _isar;

  DataExportService(this._isar);

  /// Export all transactions to a CSV file and share it
  Future<void> exportTransactionsToCsv() async {
    final transactions =
        await _isar.transactionModels.where().sortByDateDesc().findAll();

    List<List<dynamic>> rows = [];

    // Header
    rows.add([
      'Date',
      'Merchant',
      'Amount',
      'Currency',
      'Category',
      'Type',
      'Origin',
      'Notes',
      'Verified',
      'Is Subscription'
    ]);

    for (var t in transactions) {
      rows.add([
        t.date.toIso8601String(),
        t.merchantName,
        t.amount,
        t.currency,
        t.categoryId ?? '',
        t.kind.name,
        t.origin.name,
        t.notes ?? '',
        t.userVerified,
        t.isSubscription
      ]);
    }

    String csvData = const ListToCsvConverter().convert(rows);

    final directory = await getTemporaryDirectory();
    final file = File(
        '${directory.path}/pennypilot_transactions_${DateTime.now().millisecondsSinceEpoch}.csv');

    await file.writeAsString(csvData);

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'PennyPilot Transaction Export',
      text: 'Exported transaction data from PennyPilot.',
    );
  }

  /// Export a summary JSON (for backup/import purposes)
  Future<String> exportToJson() async {
    final transactions = await _isar.transactionModels.where().findAll();
    // Simplified export for now
    final data = transactions
        .map((t) => {
              'merchant': t.merchantName,
              'amount': t.amount,
              'date': t.date.toIso8601String(),
              'category': t.categoryId,
            })
        .toList();

    return data.toString();
  }
}
