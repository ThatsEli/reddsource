import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/services/reddit_service.dart';
import 'package:reddsource/services/services.dart';
import 'package:reddsource/widgets/post_list.dart';

class SubredditScreen extends StatefulWidget {
  final String subredditName;

  SubredditScreen({Key key, @required this.subredditName}) : super(key: key);

  @override
  _SubredditScreenState createState() => _SubredditScreenState();
}

class _SubredditScreenState extends State<SubredditScreen> {

  SubredditRef _subredditRef;
  Future<Subreddit> _subredditFuture;

  @override
  void initState() { 
    super.initState();
    _subredditRef = getIt.get<RedditService>().getSubredditRef(widget.subredditName);
    _subredditFuture = _subredditRef.populate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _subredditFuture,
      builder: (BuildContext context, AsyncSnapshot<Subreddit> snapshot) {
        if(!snapshot.hasData) return Scaffold(body: Center(child: Text('Loading...'),),);
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: Text(snapshot.data.title),
          ),
          body: SafeArea(
            child: Center(
              child: PostList(contentStream: snapshot.data.hot()),
            ),
          ),
        );
      },
    );
  }
}