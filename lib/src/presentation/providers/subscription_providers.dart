import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import 'database_provider.dart';

part 'subscription_providers.g.dart';

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

@riverpod
class SubscriptionManagement extends _$SubscriptionManagement {
  @override
  FutureOr<void> build() {}

  Future<void> addSubscription(SubscriptionsCompanion companion) async {
    final db = ref.read(appDatabaseProvider);
    await db.upsertSubscription(companion);
  }
}
