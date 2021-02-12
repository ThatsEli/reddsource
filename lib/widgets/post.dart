import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/post_screen/post_screen.dart';
import 'package:reddsource/screens/post_screen/submission_button_bar.dart';
import 'package:reddsource/screens/post_screen/submission_info_widget.dart';

class Post extends StatelessWidget {
  final Submission submission;
  final bool isInPostScreen;

  const Post({Key key, @required this.submission, this.isInPostScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(!isInPostScreen) Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PostScreen(submission: submission)));
      },
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubmissionInfoWidget(submission: submission),
              SizedBox(height: 10),
              Text(
                submission.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              SubmissionButtonBar(submission: submission),
            ],
          ),
        ),
      ),
    );
  }
}