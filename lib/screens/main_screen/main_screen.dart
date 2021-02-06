import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/main_screen/main_drawer.dart';
import 'package:reddsource/services/reddit_service.dart';
import 'package:reddsource/services/services.dart';
import 'package:reddsource/widgets/post_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Frontpage'),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: PostList(contentStream: getIt<RedditService>().getFrontPageStream()),
      )
    );
  }
}