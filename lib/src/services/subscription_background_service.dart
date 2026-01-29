import 'package:workmanager/workmanager.dart';
import '../data/database/app_database.dart';

class SubscriptionBackgroundService {
  static const String taskName = "com.pennypilot.subscription_sync";

  static void init() {
    Workmanager().initialize(
      callbackDispatcher,
    );
  }

  static void scheduleTask() {
    Workmanager().registerPeriodicTask(
      "1",
      taskName,
      frequency: const Duration(hours: 12),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: true,
      ),
    );
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final database = AppDatabase();

    try {
      // 1. Fetch transactions from Drift
      final driftTxns = await (database.select(database.transactions)).get();

      // 2. Map to Agent format (Simplified for this demo)
      // In a real app, we'd use the TransactionModel and the actual SubscriptionAgent

      // 3. Simple Mock Detection for Demonstration
      // (Normally this would call the SubscriptionAgent)
      final merchants = driftTxns.map((t) => t.merchantName).toSet();
      for (final merchant in merchants) {
        final mTxns =
            driftTxns.where((t) => t.merchantName == merchant).toList();
        if (mTxns.length >= 2) {
          // Potential recurring subscription
          final amount = mTxns.first.amount;
          final lastDate =
              mTxns.map((t) => t.date).reduce((a, b) => a.isAfter(b) ? a : b);

          await database.upsertSubscription(SubscriptionsCompanion.insert(
            serviceName: merchant,
            amount: amount,
            nextRenewalDate: lastDate.add(const Duration(days: 30)),
            frequency: 2, // Monthly (Drift mapped index)
            lifecycleState: 0, // Active
            firstSeenDate: mTxns
                .map((t) => t.date)
                .reduce((a, b) => a.isBefore(b) ? a : b),
            detectionSource: 2, // Pattern (Drift mapped index)
          ));
        }
      }

      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    } finally {
      await database.close();
    }
  });
}
