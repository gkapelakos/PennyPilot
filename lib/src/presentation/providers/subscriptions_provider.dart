import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';
import 'package:drift/drift.dart';

part 'subscriptions_provider.g.dart';

@riverpod
Stream<List<Subscription>> subscriptions(SubscriptionsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.subscriptions)
        ..orderBy([(t) => OrderingTerm.asc(t.nextRenewalDate)]))
      .watch();
}

@riverpod
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addSubscription(SubscriptionsCompanion subscription) async {
    final db = ref.read(appDatabaseProvider);
    await db.into(db.subscriptions).insert(subscription);
  }

  Future<void> updateSubscription(Subscription subscription) async {
    final db = ref.read(appDatabaseProvider);
    await db.update(db.subscriptions).replace(subscription);
  }
}
