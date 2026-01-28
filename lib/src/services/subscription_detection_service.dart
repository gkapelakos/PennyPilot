import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logging/logging.dart';

part 'subscription_detection_service.g.dart';

@Riverpod(keepAlive: true)
class SubscriptionDetectionService extends _$SubscriptionDetectionService {
  final _logger = Logger('SubscriptionDetectionService');
  Interpreter? _interpreter;

  @override
  Future<void> build() async {
    try {
      _interpreter = await Interpreter.fromAsset(
          'assets/models/subscription_detector.tflite');
      _logger.info('TFLite interpreter loaded successfully');
    } catch (e) {
      _logger.warning(
          'Failed to load TFLite model: $e. Using fallback detection.');
    }
  }

  Future<bool> detectSubscription(
      String merchantName, double amount, List<double> history) async {
    if (_interpreter == null) {
      return _fallbackDetection(merchantName, amount, history);
    }

    // Prepare input (example: [merchant_hash, amount, ...history])
    // This is a placeholder for the actual model input format
    final input = [0.0, amount, ...history];
    final output = List<double>.filled(1, 0).reshape([1, 1]);

    _interpreter!.run(input, output);

    final prediction = output[0][0];
    return prediction > 0.5;
  }

  bool _fallbackDetection(
      String merchantName, double amount, List<double> history) {
    // Simple regex/frequency based detection
    final lower = merchantName.toLowerCase();
    final knownSubs = [
      'netflix',
      'spotify',
      'apple',
      'google',
      'microsoft',
      'amazon prime'
    ];
    if (knownSubs.any((s) => lower.contains(s))) return true;

    // If it's the same amount multiple times
    if (history.length >= 2) {
      final last = history.last;
      if (history.every((h) => (h - last).abs() < 0.01)) return true;
    }

    return false;
  }
}
