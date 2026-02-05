import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pennypilot/src/data/models/subscription_model.dart';
import 'package:pennypilot/src/presentation/screens/subscriptions/subscription_details_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Subscription details handle long text on small screens',
      (tester) async {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.window.physicalSizeTestValue = const Size(320, 640);
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });

    final subscription = SubscriptionModel(
      serviceName:
          'A Very Long Subscription Service Name That Would Usually Overflow',
      amount: 19.99,
      nextRenewalDate: DateTime(2026, 2, 28),
      firstSeenDate: DateTime(2025, 7, 15),
      createdAt: DateTime(2025, 7, 15),
    )
      ..frequencyConsistency = 87
      ..chargeCount = 48
      ..currency = 'USD';

    await tester.pumpWidget(
      ProviderScope(
        child: MediaQuery(
          data: const MediaQueryData(textScaleFactor: 1.3),
          child: MaterialApp(
            home: SubscriptionDetailsScreen(subscription: subscription),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
