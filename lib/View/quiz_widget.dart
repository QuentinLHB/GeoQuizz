import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/View/quiz_keys_enum.dart';
import 'package:flutter_project/View/restart_widget.dart';
import 'answer_widget.dart';
import 'question_widget.dart';

/// Generated after each question
class QuizWidget extends StatelessWidget {
  Controller controller = Controller();
  final void Function(bool) answerCallBack;
  final VoidCallback resetCallBack;
  final int currentIndex;

  QuizWidget({required this.resetCallBack, required this.answerCallBack, required this.currentIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      QuestionWidget(controller.currentQuestion.question, textToHighlight: controller.currentQuestion.textToHighLight),
      ...(controller.currentQuestion.allAnswers)
          .map((e) => AnswerWidget(answerCallBack, e, isAnswerRight(e)))
          .toList(),
      Spacer(),
      RestartWidget(resetCallBack),
    ]);
  }

  bool isAnswerRight(String answer) {
    return controller.isRight(answer);
  }
}
