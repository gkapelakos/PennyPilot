import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';
import 'package:drift/drift.dart';

part 'transactions_provider.g.dart';

@riverpod
Stream<List<Transaction>> transactions(TransactionsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.transactions)
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
      .watch();
}

@riverpod
Stream<List<Transaction>> recentTransactions(RecentTransactionsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
  return (db.select(db.transactions)
        ..where((t) => t.date.isBiggerThan(Variable(thirtyDaysAgo)))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
      .watch();
}

@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addTransaction(TransactionsCompanion transaction) async {
    final db = ref.read(appDatabaseProvider);
    await db.into(db.transactions).insert(transaction);
  }

  Future<void> deleteTransaction(int id) async {
    final db = ref.read(appDatabaseProvider);
    await (db.delete(db.transactions)..where((t) => t.id.equals(id))).go();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    final db = ref.read(appDatabaseProvider);
    await db.update(db.transactions).replace(transaction);
  }
}
