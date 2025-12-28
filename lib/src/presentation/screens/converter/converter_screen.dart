import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/presentation/providers/currency_provider.dart';

class CurrencyConverterScreen extends ConsumerStatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends Consumer<CurrencyConverterScreen> {
  final _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _convertedAmount = 0.0;

  void _convert(Map<String, dynamic> exchangeRates) {
    final amount = double.tryParse(_amountController.text);
    if (amount != null && exchangeRates.isNotEmpty) {
      final fromRate = exchangeRates[_fromCurrency]?.toDouble() ?? 1.0;
      final toRate = exchangeRates[_toCurrency]?.toDouble() ?? 1.0;
      setState(() {
        _convertedAmount = amount * (toRate / fromRate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final exchangeRatesState = ref.watch(exchangeRatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: exchangeRatesState.when(
          data: (exchangeRates) {
            if (exchangeRates.isEmpty) {
              return Center(child: Text('No exchange rates available.'));
            }
            // Ensure default currencies are valid
            if (!exchangeRates.keys.contains(_fromCurrency)) {
              _fromCurrency = exchangeRates.keys.first;
            }
            if (!exchangeRates.keys.contains(_toCurrency)) {
              _toCurrency = exchangeRates.keys.skip(1).first;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => _convert(exchangeRates),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildCurrencySelector('From', _fromCurrency, (val) => setState(() => _fromCurrency = val!), exchangeRates)),
                    IconButton(icon: Icon(Icons.swap_horiz), onPressed: () {
                      setState(() {
                        final temp = _fromCurrency;
                        _fromCurrency = _toCurrency;
                        _toCurrency = temp;
                        _convert(exchangeRates);
                      });
                    }),
                    Expanded(child: _buildCurrencySelector('To', _toCurrency, (val) => setState(() => _toCurrency = val!), exchangeRates)),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text('Converted Amount', style: Theme.of(context).textTheme.labelLarge),
                      SizedBox(height: 8),
                      Text(
                        '${_convertedAmount.toStringAsFixed(2)} $_toCurrency',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 20),
                 Text(
                  'Last updated: ${exchangeRatesState.value?['last_updated_utc'] ?? 'N/A'}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }

  Widget _buildCurrencySelector(String title, String value, ValueChanged<String?> onChanged, Map<String, dynamic> exchangeRates) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
      items: exchangeRates.keys.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
          _convert(exchangeRates);
        }
      },
    );
  }
}
