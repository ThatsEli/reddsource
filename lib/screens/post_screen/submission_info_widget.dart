import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/subreddit_screen/subreddit_screen.dart';

class SubmissionInfoWidget extends StatelessWidget {
  final Submission submission;

  const SubmissionInfoWidget({Key key, @required this.submission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Text(
            'r/' + submission.subreddit.displayName,
            style: TextStyle(
              color: subredditColor
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubredditScreen(subredditName: submission.subreddit.displayName)));
          },
        ),
        SizedBox(width: 10),
        Text(
          'u/' + submission.author,
          style: TextStyle(
            color: userColor
          ),
        ),
        SizedBox(width: 10),
        Text(submission.createdUtc.day.toString() + '.' + submission.createdUtc.month.toString() + '.' + submission.createdUtc.year.toString()),
      ]
    );
  }
}