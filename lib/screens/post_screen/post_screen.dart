import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/post_screen/comment_section.dart';
import 'package:reddsource/widgets/post.dart';

class PostScreen extends StatefulWidget {
  final Submission submission;

  PostScreen({Key key, @required this.submission}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  Future<CommentForest> _comments;

  @override
  void initState() {
    super.initState();
    _comments = widget.submission.refreshComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.submission.title),
      ),
      body: FutureBuilder(
        future: _comments,
        builder: (BuildContext context, AsyncSnapshot<CommentForest> snapshot) {

          Widget postWidget = Hero(
            tag: Key(widget.submission.id),
            child: Post(submission: widget.submission, isInPostScreen: true)
          );

          if(!snapshot.hasData) return Column(
            children: [
              postWidget,
              Text('Loading...'),
              LinearProgressIndicator(),
            ],
          );

          return CommentSection(
            leadingWidget: postWidget,
            commentForest: snapshot.data as CommentForest
          );
          // return ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: snapshot.data.comments.length + 1,
          //   itemBuilder: (BuildContext context, int index) {
          //     if(index == 0)
          //        return postWidget;
          //     return Text(
          //       (snapshot.data.comments[index-1] as Comment).body
          //     );
          //   }
          // );
        },
      ),
      // ListView(
      //   children: [
      //     Hero(
      //       tag: Key(widget.submission.id),
      //       child: Post(submission: widget.submission, isInPostScreen: true)
      //     ),
      //     FutureBuilder(
      //       future: _comments,
      //       builder: (BuildContext context, AsyncSnapshot<CommentForest> snapshot) {
      //         if(!snapshot.hasData) return Text('Loading...');
      //         return ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: snapshot.data.comments.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Text(
      //               (snapshot.data.comments[index] as Comment).body
      //             );
      //           }
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}