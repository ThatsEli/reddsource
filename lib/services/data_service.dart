import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class DataService {

  Random _random;
  SharedPreferences prefs;  

  DataService() {
    _random = Random.secure();
  }

  Future<void> init() async {
    if(prefs == null) { prefs = await SharedPreferences.getInstance(); }
  } 

  String randomString(int length) {
    return base64Url.encode(List<int>.generate(length+2, (i) => _random.nextInt(256))).substring(0, length).replaceAll('_', 'X');
  }

}