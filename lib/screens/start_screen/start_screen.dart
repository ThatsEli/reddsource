import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/login_screen/login_screen.dart';
import 'package:reddsource/screens/main_screen/main_screen.dart';
import 'package:reddsource/services/reddit_service.dart';
import 'package:reddsource/services/services.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration(milliseconds: 100));
      if(getIt.get<RedditService>().ready) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      }
    }();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(child: Text('Logging in...'))
    );
  }
}