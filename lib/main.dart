import 'package:flutter/material.dart';
import 'package:reddsource/screens/start_screen/start_screen.dart';
import 'package:reddsource/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddsource',
      theme: ThemeData.dark(),
      home: StartScreen()
    );
  }
}