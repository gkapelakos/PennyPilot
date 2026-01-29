import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'database_provider.dart';
import '../../data/database/app_database.dart';

part 'database_streams.g.dart';

@riverpod
Stream<List<Transaction>> allTransactions(AllTransactionsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.transactionDao.watchAllTransactions();
}

@riverpod
Stream<List<Receipt>> allReceipts(AllReceiptsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.receiptDao.watchAllReceipts();
}

@riverpod
Stream<List<Subscription>> allSubscriptions(AllSubscriptionsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchAllSubscriptions();
}

@riverpod
Stream<double> monthlySubscriptionTotal(MonthlySubscriptionTotalRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.watchMonthlySubscriptionTotal();
}
