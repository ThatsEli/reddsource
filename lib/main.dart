import 'package:flutter/material.dart';
import 'package:reddsource/screens/login_screen/login_screen.dart';
import 'package:reddsource/services/services.dart';

void main() {
  initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddsource',
      theme: ThemeData.dark(),
      home: LoginScreen()
    );
  }
}