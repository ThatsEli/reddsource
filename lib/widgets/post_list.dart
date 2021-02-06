import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/widgets/post.dart';

class PostList extends StatefulWidget {
  final Stream<UserContent> contentStream;

  PostList({Key key, @required this.contentStream}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  List<Submission> submissions;

  @override
  void initState() {
    submissions = [];
    super.initState();
    widget.contentStream.listen((UserContent newUserContent) {
      if(newUserContent.runtimeType == Submission)
      setState(() {
        submissions.add(newUserContent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(submissions.length == 0) return Center(child: Text('Loading...'));
    return ListView.builder(
      itemCount: submissions.length,
      itemBuilder: (BuildContext context, int index) {
        return Post(submission: submissions[index]);
      },
    );
  }
}