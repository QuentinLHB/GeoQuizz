import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {

  final void Function(bool) onPressHandler;
  final String answerText;
  final bool rightAnswer;

  void onPress(){
      onPressHandler(rightAnswer);
  }

  AnswerWidget(this.onPressHandler, this.answerText, this.rightAnswer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: onPress, child: Text(answerText)),
      width: double.infinity,
    );
  }
}
