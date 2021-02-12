import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

class SingleComment extends StatelessWidget {
  final Comment comment;

  const SingleComment({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<dynamic> replies = [];

    if(comment.replies != null) {
      for (dynamic reply in comment.replies.comments) {
        replies.add(reply);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: comment.depth * 8.0,
            top: comment.depth == 0 ? 0 : 8
          ),
          child: Text(comment.body),
        ),
        for (var reply in replies)
          if(reply.runtimeType == Comment)
            SingleComment(comment: reply),
        if(comment.depth == 0)
          Divider()
      ],
    );
  }
}