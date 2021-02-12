import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/screens/post_screen/comment.dart';
class CommentSection extends StatelessWidget {
  final Widget leadingWidget;
  final CommentForest commentForest;

  const CommentSection({Key key, @required this.leadingWidget, @required this.commentForest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commentForest.comments.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if(index == 0)
            return leadingWidget;
        if(commentForest.comments[index-1].runtimeType == Comment)
          return SingleComment(
            comment: commentForest.comments[index-1],
          );
        return Text('Load more...');
      }
    );
  }
}
