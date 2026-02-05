import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/presentation/screens/transactions/transaction_details_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Transaction details handle long text on small screens',
      (tester) async {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.window.physicalSizeTestValue = const Size(320, 640);
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });

    final transaction = TransactionModel()
      ..merchantName =
          'The Extremely Long Merchant Name That Would Usually Overflow'
      ..rawMerchantName =
          'Original Merchant Name That Is Also Very Long To Stress Layout'
      ..amount = 1234.56
      ..date = DateTime(2026, 2, 1, 9, 30)
      ..category = 'Very Long Category Name That Can Overflow'
      ..createdAt = DateTime(2026, 2, 1);

    await tester.pumpWidget(
      ProviderScope(
        child: MediaQuery(
          data: const MediaQueryData(textScaleFactor: 1.3),
          child: MaterialApp(
            home: TransactionDetailsScreen(transaction: transaction),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
