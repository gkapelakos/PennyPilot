import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:pennypilot/src/data/models/subscription_model.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/services/subscription_intelligence_service.dart';

void main() {
  late Isar isar;
  late SubscriptionIntelligenceService service;

  setUp(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open(
      [SubscriptionModelSchema, TransactionModelSchema],
      directory: '.',
      name: 'testDb',
    );

    service = SubscriptionIntelligenceService(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  // Helper to create a subscription with all required fields
  SubscriptionModel createSubscription({
    required String serviceName,
    required double amount,
    String? priceHistoryJson,
    required SubscriptionLifecycleState lifecycleState,
  }) {
    return SubscriptionModel(
      serviceName: serviceName,
      amount: amount,
      nextRenewalDate: DateTime.now().add(const Duration(days: 30)),
      frequency: SubscriptionFrequency.monthly,
      lifecycleState: lifecycleState,
      firstSeenDate: DateTime.now(),
      frequencyConsistency: 100,
      detectionSource: SubscriptionDetectionSource.manual,
      chargeCount: 1,
      createdAt: DateTime.now(),
    )..priceHistoryJson = priceHistoryJson;
  }

  group('SubscriptionIntelligenceService Tests', () {
    test('detects price hike', () async {
      final sub = createSubscription(
        serviceName: 'Netflix',
        amount: 15.99,
        priceHistoryJson: '[10.99, 15.99]',
        lifecycleState: SubscriptionLifecycleState.active,
      );

      await isar.writeTxn(() async => await isar.subscriptionModels.put(sub));
      await service.evaluateSubscription(sub);

      final result = await isar.subscriptionModels.get(sub.id);
      expect(result!.anomalies, contains(SubscriptionAnomaly.priceHike.name));
    });

    test('detects price drop', () async {
      final sub = createSubscription(
        serviceName: 'Netflix',
        amount: 10.99,
        priceHistoryJson: '[15.99, 10.99]',
        lifecycleState: SubscriptionLifecycleState.active,
      );

      await isar.writeTxn(() async => await isar.subscriptionModels.put(sub));
      await service.evaluateSubscription(sub);

      final result = await isar.subscriptionModels.get(sub.id);
      expect(result!.anomalies, contains(SubscriptionAnomaly.priceDrop.name));
    });

    test('detects zombie subscription', () async {
      final sub = createSubscription(
        serviceName: 'Amazon Prime',
        amount: 14.99,
        lifecycleState: SubscriptionLifecycleState.active,
      );

      await isar.writeTxn(() async => await isar.subscriptionModels.put(sub));
      await service.evaluateSubscription(sub);

      final result = await isar.subscriptionModels.get(sub.id);
      expect(result!.anomalies, contains(SubscriptionAnomaly.zombie.name));
    });

    test('does not detect zombie subscription if inactive', () async {
      final sub = createSubscription(
        serviceName: 'Old Gym',
        amount: 25.00,
        lifecycleState: SubscriptionLifecycleState.cancelled,
      );

      await isar.writeTxn(() async => await isar.subscriptionModels.put(sub));
      await service.evaluateSubscription(sub);

      final result = await isar.subscriptionModels.get(sub.id);
      expect(result!.anomalies, isEmpty);
    });
  });
}
