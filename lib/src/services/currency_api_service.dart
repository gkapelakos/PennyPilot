
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyApiService {
  static const String _apiUrl = 'https://open.er-api.com/v6/latest/USD';

  Future<Map<String, dynamic>> getExchangeRates() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] == 'success') {
          return data['rates'];
        } else {
          throw Exception('Failed to load exchange rates: API result was not "success"');
        }
      } else {
        throw Exception('Failed to load exchange rates: Status code ${response.statusCode}');
      }
    } catch (e) {
      // In a real app, you'd want to log this error and show a user-friendly message
      print('Error fetching exchange rates: $e');
      rethrow;
    }
  }
}
