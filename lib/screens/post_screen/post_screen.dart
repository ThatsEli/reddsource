import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/post_screen/submission_button_bar.dart';
import 'package:reddsource/screens/post_screen/submission_info_widget.dart';

class PostScreen extends StatefulWidget {
  final Submission submission;

  PostScreen({Key key, @required this.submission}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.submission.title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Card(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubmissionInfoWidget(submission: widget.submission),
                  SizedBox(height: 10),
                  Text(
                    widget.submission.title,
                    style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(height: 10),
                  Text(widget.submission.selftext),
                  SubmissionButtonBar(submission: widget.submission),
                ],
              ),
            ),  
          )
        ],
      ),
    );
  }
}