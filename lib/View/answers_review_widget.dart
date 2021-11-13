import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/View/question_widget.dart';
import 'package:flutter_project/tools/tools.dart';
import 'package:flutter_project/View/constants.dart' as constants;

class AnswersReview extends StatelessWidget {
  final Controller controller = Controller();

  AnswersReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.quiz.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Question " + (index + 1).toString() + " :",
                  style: TextStyle(color: constants.normalColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 10),
                child: Tools.richTextBuilder(
                  context,
                  controller.quiz[index].question,
                  textToHighlight: controller.quiz[index].textToHighLight,
                  normalColor: constants.normalColor,
                  highlightColor: constants.highLightColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 10),
                child: Tools.richTextBuilder(
                  context,
                  "Votre réponse : " + controller.quiz[index].userAnswer,
                  textToHighlight: [controller.quiz[index].userAnswer],
                  normalColor: constants.normalColor,
                  highlightColor: controller.isAnswerRight(
                          controller.quiz[index],
                          controller.quiz[index].userAnswer)
                      ? constants.correctAnswer
                      : constants.incorrectAnswer,
                ),
              ),
              !controller.isAnswerRight(
                      controller.quiz[index], controller.quiz[index].userAnswer)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                      child: Tools.richTextBuilder(
                        context,
                        "Bonne réponse : " + controller.quiz[index].rightAnswer,
                        textToHighlight: [controller.quiz[index].rightAnswer],
                        normalColor: constants.normalColor,
                        highlightColor: constants.correctAnswer,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: null),
            ],
          );
        });
  }
}
