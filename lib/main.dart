import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_flutter_crypto_mvp_architecture/home_page.dart';
import 'package:my_flutter_crypto_mvp_architecture/dependency_injecion.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: HomePage(),
    );
  }
}