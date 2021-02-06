import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final Submission submission;

  const Post({Key key, @required this.submission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('r/' + submission.subreddit.displayName),
                SizedBox(width: 10),
                Text('u/' + submission.author),
                SizedBox(width: 10),
                Text(submission.createdUtc.day.toString() + '.' + submission.createdUtc.month.toString() + '.' +submission.createdUtc.year.toString()),
              ]
            ),
            SizedBox(height: 10),
            Text(
              submission.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              children: [
                Text((submission.comments != null ? submission.comments.toList().length.toString() : '0') + ' comments'),
                SizedBox(width: 10),
                Text(submission.upvotes.toString()),
                // SizedBox(width: 10),
                // Text(submission.createdUtc.day.toString() + '.' + submission.createdUtc.month.toString() + '.' +submission.createdUtc.year.toString()),
              ]
            ),
          ],
        ),
      ),
    );
  }
}