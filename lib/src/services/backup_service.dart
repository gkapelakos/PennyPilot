import 'dart:io';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/services/auth_service.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:share_plus/share_plus.dart';

class BackupService {
  final AppDatabase _db;
  final _logger = Logger('BackupService');

  BackupService(this._db);

  Future<void> exportToCsv() async {
    try {
      final transactions = await _db.select(_db.transactions).get();

      final List<List<dynamic>> rows = [
        [
          'Date',
          'Merchant',
          'Amount',
          'Currency',
          'Category ID',
          'Is Subscription',
        ]
      ];

      for (final t in transactions) {
        rows.add([
          t.date.toIso8601String(),
          t.merchantName,
          t.amount,
          t.currency,
          t.categoryId ?? '',
          t.isSubscription ? 'Yes' : 'No',
        ]);
      }

      final csvData = const ListToCsvConverter().convert(rows);
      final tempDir = await getTemporaryDirectory();
      final csvFile = File('${tempDir.path}/pennypilot_transactions.csv');
      await csvFile.writeAsString(csvData);

      await Share.shareXFiles([XFile(csvFile.path)],
          text: 'PennyPilot Transactions CSV');
    } catch (e) {
      _logger.severe('CSV Export failed', e);
      rethrow;
    }
  }

  /// The "Nuclear Option": Delete all data
  Future<void> nuclearWipe() async {
    try {
      _logger.warning('EXECUTING NUCLEAR WIPE');

      // Drift doesn't have a simple clearAll, so we delete from each table
      await _db.transaction(() async {
        await _db.delete(_db.transactions).go();
        await _db.delete(_db.subscriptions).go();
        await _db.delete(_db.categories).go();
        await _db.delete(_db.mappings).go();
        await _db.delete(_db.budgets).go();
        await _db.delete(_db.splits).go();
      });

      _logger.info('Nuclear wipe complete');
    } catch (e) {
      _logger.severe('Nuclear wipe failed', e);
      rethrow;
    }
  }
}
