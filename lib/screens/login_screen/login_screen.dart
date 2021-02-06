import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:reddsource/constants/functional.dart';
import 'package:reddsource/screens/main_screen/main_screen.dart';
import 'package:reddsource/services/reddit_service.dart';
import 'package:reddsource/services/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrl: getIt.get<RedditService>().generateAuthUrl(),
          onLoadStart: (InAppWebViewController controller, String newUrl) async {
            final String filter = redirectUrl + '?state=' + getIt.get<RedditService>().state + '&code=';
            if(newUrl.contains(filter)) {
              final String code = newUrl.replaceAll(filter, '');
              if(await getIt.get<RedditService>().authorize(code)) {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
              } else {
                throw ErrorDescription('No auth');
              }
            }
          },
        ),
      ),
    );
  }
}