import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/View/quiz_keys_enum.dart';
import 'answer_widget.dart';
import 'question_widget.dart';

class QuizzWidget extends StatelessWidget {

  Controller controller = Controller();
  final void Function(bool) answerCallBack;
  final int currentIndex;

  QuizzWidget(this.answerCallBack, this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    QuestionWidget(controller.getCurrentQuestion().question),
...(controller.getCurrentQuestion().allAnswers)
    .map((e) => AnswerWidget(answerCallBack, e, isAnswerRight(e)))
    .toList()
]);
  }

  bool isAnswerRight(String answer) {
    return controller.submit(answer);
  }
}
