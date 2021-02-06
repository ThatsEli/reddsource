import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddsource/constants/design.dart';

class SubmissionButtonBar extends StatefulWidget {
  final Submission submission;

  SubmissionButtonBar({Key key, @required this.submission}) : super(key: key);

  @override
  _SubmissionButtonBarState createState() => _SubmissionButtonBarState();
}

class _SubmissionButtonBarState extends State<SubmissionButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                widget.submission.refresh().then((value) => setState(() {}));
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
                widget.submission.refresh().then((value) => setState(() {}));
              },
            ),
          ],
        )
      ]
    );
  }
}