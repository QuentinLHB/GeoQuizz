import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {

  final void Function(bool) onPressHandler;
  final String answerText;
  final bool isRight;

  AnswerWidget(this.onPressHandler, this.answerText, this.isRight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
          child: ElevatedButton(onPressed: () => onPressHandler(isRight), child: Text(answerText))),
      width: MediaQuery.of(context).size.width /2,
    );
  }
}
