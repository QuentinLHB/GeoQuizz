import 'package:flutter/material.dart';
import './answer_widget.dart';
import './question_widget.dart';
import './quiz_keys_enum.dart';

class QuizzWidget extends StatelessWidget {

  List<Map<QuizKeys, Object>> questions;
  final void Function(bool) answerCallBack;
  final int currentIndex;

  QuizzWidget(this.questions, this.answerCallBack, this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    QuestionWidget((questions[currentIndex][QuizKeys.question]
as String)),
...(questions[currentIndex][QuizKeys.allAnswers]
as List<String>)
    .map((e) => AnswerWidget(answerCallBack, e, isAnswerRight(e)))
    .toList()
]);
  }

  bool isAnswerRight(String answer) {
    return answer == questions[currentIndex][QuizKeys.rightAnswer];
  }
}
