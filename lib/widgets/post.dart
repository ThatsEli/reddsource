import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';
import 'package:reddsource/screens/subreddit_screen/subreddit_screen.dart';

class Post extends StatefulWidget {
  final Submission submission;

  const Post({Key key, @required this.submission}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Text(
                    'r/' + widget.submission.subreddit.displayName,
                    style: TextStyle(
                      color: subredditColor
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubredditScreen(subredditName: widget.submission.subreddit.displayName,)));
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'u/' + widget.submission.author,
                  style: TextStyle(
                    color: userColor
                  ),
                ),
                SizedBox(width: 10),
                Text(widget.submission.createdUtc.day.toString() + '.' + widget.submission.createdUtc.month.toString() + '.' +widget.submission.createdUtc.year.toString()),
              ]
            ),
            SizedBox(height: 10),
            Text(
              widget.submission.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((widget.submission.comments != null ? widget.submission.comments.toList().length.toString() : '0') + ' comments'),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward_rounded),
                      onPressed: () async {
                        if(widget.submission.vote == VoteState.upvoted) await widget.submission.clearVote();
                        else await widget.submission.upvote();
                        setState(() {});
                      },
                    ),
                    Text(
                      widget.submission.upvotes.toString(),
                      style: TextStyle(
                        color: widget.submission.vote == VoteState.upvoted ? subredditColor : widget.submission.vote == VoteState.downvoted ? userColor : null
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_downward_rounded),
                      onPressed: () async {
                        if(widget.submission.vote == VoteState.downvoted) await widget.submission.clearVote();
                        else await widget.submission.downvote();
                        setState(() {});
                      },
                    ),
                  ],
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}