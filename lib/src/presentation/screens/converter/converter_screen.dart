import 'package:flutter/material.dart';

const Map<String, double> exchangeRates = {
  'USD': 1.0,
  'EUR': 0.92,
  'JPY': 157.65,
  'GBP': 0.79,
  'AUD': 1.51,
  'CAD': 1.37,
  'CHF': 0.90,
  'CNY': 7.25,
  'HKD': 7.81,
  'NZD': 1.63,
};

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _convertedAmount = 0.0;

  void _convert() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null) {
      final rate = exchangeRates[_toCurrency]! / exchangeRates[_fromCurrency]!;
      setState(() {
        _convertedAmount = amount * rate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _convert(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildCurrencySelector('From', _fromCurrency, (val) => setState(() => _fromCurrency = val!))),
                IconButton(icon: Icon(Icons.swap_horiz), onPressed: () {
                  setState(() {
                    final temp = _fromCurrency;
                    _fromCurrency = _toCurrency;
                    _toCurrency = temp;
                    _convert();
                  });
                }),
                Expanded(child: _buildCurrencySelector('To', _toCurrency, (val) => setState(() => _toCurrency = val!))),
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
            ElevatedButton(onPressed: _convert, child: Text('Convert')),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencySelector(String title, String value, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
      items: exchangeRates.keys.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
      onChanged: onChanged,
    );
  }
}
