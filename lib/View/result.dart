import 'package:flutter/material.dart';
import 'package:flutter_project/View/restart_widget.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final int maxScore;
  final VoidCallback resetCallBack;

  ResultWidget(this.resetCallBack, this.score, this.maxScore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
            flex: 8,
              child: Container(
                width: double.infinity,
                child:
                Center(
                  child: Text(
                    score.toString() + (score <2 ? " point !": " points !"),
                    style: TextStyle(fontSize: 30,
                        color: score >= maxScore/2 ? Colors.green : Colors.red),
                    textAlign: TextAlign.center,
                  )
                )
              )
          ),
          Expanded(
              flex:2,
            child: RestartWidget(resetCallBack),

          ),


        ],
      ),

    );
  }
}
