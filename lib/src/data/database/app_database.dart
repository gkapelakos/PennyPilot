import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'daos/receipt_dao.dart';
import 'daos/transaction_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  include: {'tables.drift'},
  daos: [ReceiptDao, TransactionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            // V1 to V2: Add new columns or indexes if needed
            // The tables.drift now includes 'receipts' which is new
            await m.createTable(receipts);

            // Add any other schema evolution here
            // e.g., await m.addColumn(transactions, transactions.someNewColumn);
          }
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            // If the database was just created, check for legacy v1 files (raw SQLite)
            await _emergencyV1Migration();
          }
        },
      );

  // --- Legacy Migration Logic ---

  static Future<void> _emergencyV1Migration() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final v1Path = p.join(docsDir.path, 'pennypilot.db');
    final v1SqlitePath = p.join(docsDir.path, 'pennypilot.sqlite');

    if (await File(v1Path).exists()) {
      await _migrateRawV1toV2(v1Path);
    } else if (await File(v1SqlitePath).exists()) {
      // If we are migrating from the old drift v1 file to a new v2 file structure if needed
      // But typically Drift handles this via onUpgrade if the filename is the same.
      // The user requested a 'pennypilot_v2.db' specifically.
    }
  }

  static Future<void> _migrateRawV1toV2(String v1Path) async {
    final v1File = File(v1Path);
    // Use a temporary database to read from the old file
    final v1Db = AppDatabase._forFile(v1File);

    try {
      final rows = await v1Db.customSelect('SELECT * FROM receipts').get();
      final v2Db = AppDatabase();

      for (final row in rows) {
        await v2Db.receiptDao.insertReceipt(ReceiptsCompanion.insert(
          vendor: row.read<String>('vendor'),
          amount: row.read<double>('amount'),
          date: DateTime.tryParse(row.read<String>('date')) ?? DateTime.now(),
        ));
      }

      await v1Db.close();
      await v1File.delete(); // Cleanup after successful migration
    } catch (e) {
      // Log error properly in a real app
      debugPrint('Migration failed: $e');
      await v1Db.close();
    }
  }

  // Helper for migration
  AppDatabase._forFile(File file) : super(NativeDatabase(file));

  // --- Existing Queries (Wrapped in DAOs or directly here for backward compatibility) ---

  Stream<List<Subscription>> watchAllSubscriptions() {
    return select(subscriptions).watch();
  }

  Stream<double> watchMonthlySubscriptionTotal() {
    return select(subscriptions).watch().map((subs) {
      double total = 0;
      for (final sub in subs) {
        switch (sub.frequency) {
          case 0:
            total += sub.amount * 4;
            break;
          case 1:
            total += sub.amount * 2;
            break;
          case 2:
            total += sub.amount;
            break;
          case 3:
            total += sub.amount / 3;
            break;
          case 4:
            total += sub.amount / 6;
            break;
          case 5:
            total += sub.amount / 12;
            break;
          default:
            total += sub.amount;
        }
      }
      return total;
    });
  }

  Future<void> upsertSubscription(SubscriptionsCompanion entry) async {
    await into(subscriptions).insertOnConflictUpdate(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final v2File = File(p.join(dbFolder.path, 'pennypilot_v2.db'));
    final v1File = File(p.join(dbFolder.path, 'pennypilot.sqlite'));

    // Move from v1 drift file to v2 if necessary, or just use the same file renaming logic
    if (!await v2File.exists() && await v1File.exists()) {
      await v1File.copy(v2File.path);
      // We keep the old one as fallback until we are sure?
      // User said "BACKWARDS COMPATIBLE - New APK reads v1 DB without wipe"
    }

    return NativeDatabase(v2File);
  });
}
