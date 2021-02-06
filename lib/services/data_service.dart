import 'dart:convert';
import 'dart:math';

class DataService {

  Random _random;

  DataService() {
    _random = Random.secure();
  }

  String randomString(int length) {
    return base64Url.encode(List<int>.generate(length+2, (i) => _random.nextInt(256))).substring(0, length).replaceAll('_', 'X');
  }

}