import 'package:my_flutter_crypto_mvp_architecture/models/crypto_model.dart';
import 'package:my_flutter_crypto_mvp_architecture/models/crypto_model_mock.dart';
import 'package:my_flutter_crypto_mvp_architecture/models/crypto_model_prod.dart';

enum Flavor {MOCK, PROD}

//DI 
class Injector{
  static final Injector _singleton = injector._internal(); //private constructor  ,,, those are classes we can have only one single instances of those classes
  static Flavor _flavor;


  static void configure(Flavor flavor){
    _flavor = flavor;

  }

  factory Injectory(){
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository{
    switch(_flavor){
      case Flavor.MOCK : return new MockCryptoRepository();
      default: return new ProdCryptoRepository();
    }

  }



} 