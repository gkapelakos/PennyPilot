import 'dart:async';
import 'package:receipt_recognition/receipt_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

part 'receipt_scanner.g.dart';

@Riverpod(keepAlive: true)
class ReceiptScanner extends _$ReceiptScanner {
  late ReceiptOptions _options;

  @override
  void build() {
    _options = ReceiptOptions.fromLayeredJson({
      'extend': {
        'storeNames': {
          'REWE CITY': 'Rewe',
          'LIDL': 'Lidl',
          'ALDI SÜD': 'Aldi',
        }
      },
      'tuning': {
        'optimizerConfidenceThreshold': 88,
      }
    });
  }

  Future<RecognizedReceipt?> scanReceipt(String imagePath) async {
    final completer = Completer<RecognizedReceipt?>();

    final recognizer = ReceiptRecognizer(
      onScanComplete: (receipt) {
        if (!completer.isCompleted) {
          completer.complete(receipt);
        }
      },
      options: _options,
    );

    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      await recognizer.processImage(inputImage);

      // The processImage might be async but the result comes via callback.
      // If it doesn't come immediately, we wait.
      return await completer.future.timeout(
        const Duration(seconds: 15),
        onTimeout: () => null,
      );
    } catch (e) {
      return null;
    }
  }
}
