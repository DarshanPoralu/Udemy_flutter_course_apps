import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String url = 'https://rest.coinapi.io/v1/exchangerate/';
const String apiKey = 'EB03CEB4-A0D9-4C9E-8A88-8094DE684C77';

class CoinData {

  Future getData(String selectedCurrency) async {
    Map<String, String> cryptoRates = {};
    for (String cryptoType in cryptoList) {
      http.Response response = await http.get(
          Uri.parse(url + '$cryptoType/$selectedCurrency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double rate = data['rate'];
        cryptoRates[cryptoType] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoRates;
  }
}
