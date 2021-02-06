import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/main_screen/main_screen.dart';
import 'package:reddsource/services/reddit_service.dart';
import 'package:reddsource/services/services.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            children: [
              FutureBuilder(
                future: getIt.get<RedditService>().me,
                builder: (BuildContext context, AsyncSnapshot<Redditor> snapshot) {
                  if(!snapshot.hasData) return Text('Loading...');
                  return Row(
                    children: [
                      Icon(Icons.circle, color: Colors.orange, size: 50),
                      SizedBox(width: 10),
                      Text('u/' + snapshot.data.displayName)
                    ],
                  );
                },
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                },
              ),
              ListTile(
                title: Text('Test'),
                leading: Icon(Icons.question_answer),
              ),
              Divider(),
              Center(
                child: Text(
                  'Subscribed subreddits',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Column(
                children: getIt.get<RedditService>().getSubscribedSubreddits().map((Subreddit subreddit) =>
                  ListTile(
                    title: Text('r/' + subreddit.displayName),
                    leading: Icon(Icons.circle, color: Colors.blue),
                  )
                ).toList()
              ),
            ],
          ),
        ),
      ),
    );
  }
}