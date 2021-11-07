import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final int maxScore;

  ResultWidget(this.score, this.maxScore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      score.toString() + (score <2 ? "point !": "points !"),
      style: TextStyle(fontSize: 30,
      color: score >= maxScore/2 ? Colors.green : Colors.red),

    ));
  }
}
