//TODO: Add your imports here.
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //TODO: Create your getCoinData() method here.

  String requestURL = '$bitcoinAverageURL/BTCUSD';

  Future getCoinData() async {
    http.Response response = await http.get(
        Uri.encodeFull(requestURL),
        headers: {
          "Accept": "application/json"
        }
    );

    if (response.statusCode == 200 ) {
      var decodeData = jsonDecode(response.body);
      var lastPrice = decodeData['last'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }


  }

}
