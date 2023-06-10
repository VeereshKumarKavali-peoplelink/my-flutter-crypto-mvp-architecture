import 'dart:convert';
import 'dart:async';

import 'package:my_flutter_crypto_mvp_architecture/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CryptoRepository{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  @override
  Future<List<Crypto>> fetchCurrencies()async {
    
    http.Response response = await http.get(Uri.parse(cryptoUrl));
    final List responseBody =  json.decode(response.body);
    final statusCode = response.statusCode;
    // ignore: unnecessary_null_comparison
    if (statusCode != 200 || responseBody == null){
      throw FetchDataException("An Error occured: [StatusCode: $statusCode]");

    }

    return responseBody.map((c) => Crypto.fromMap(c) ,).toList();


    
  }

}