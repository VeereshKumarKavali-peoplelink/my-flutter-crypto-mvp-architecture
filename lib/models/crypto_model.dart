import "dart:async";

class Crypto{
  late String name;
  late String price_usd;
  late String percent_change_1h;

  Crypto({required this.name, required this.price_usd, required this.percent_change_1h});

  Crypto.fromMap(Map<String, dynamic> map): name=map["name"], price_usd=map["price_usd"], percent_change_1h=map["percent_change_1h"];
  
}

abstract class CryptoRepository{
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception{
  final dynamic  _message;

  FetchDataException([this._message]);

  @override
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }

}