import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/services/currency_api_service.dart';

final currencyApiServiceProvider = Provider<CurrencyApiService>((ref) {
  return CurrencyApiService();
});

final exchangeRatesProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final currencyApiService = ref.watch(currencyApiServiceProvider);
  return await currencyApiService.getExchangeRates();
});
