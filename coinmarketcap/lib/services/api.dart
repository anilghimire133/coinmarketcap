import 'dart:async';
import 'dart:convert';
import 'package:coinmarketcap/models/coinmart.dart';
import 'package:http/http.dart' as http;

class Api {
  static const BASE_URL =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";
  Future<List<CoinMart>> getCoinList() async {
    final response = await http.get(
      Uri.parse('$BASE_URL'),
      headers: {'X-CMC_PRO_API_KEY': '41dc05a1-26c5-46cf-8c99-df7e38e01f42'},
    );
    var jsonresponse = jsonDecode(response.body);
    var coin = jsonresponse['data'];
    List<CoinMart> coinmart = <CoinMart>[];
    coin.forEach((item) {
      CoinMart coinmarts = CoinMart.fromJson(item);
      coinmart.add(coinmarts);
    });

    return coinmart;
  }
}
