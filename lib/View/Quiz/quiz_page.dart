import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/Model/question.dart';

import '../quiz_widget.dart';
import '../result.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  // This widget is the root of your application.


  var controller = Controller();

  List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'GeoQuiz',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text(controller.quizStatus)),
            body: controller.currentIndex < _questions.length
                ? QuizWidget(resetCallBack: reset, answerCallBack: validateAnswer, currentIndex:controller.currentIndex)
                : ResultWidget(reset, controller.score, _questions.length)
        ));
  }

  void validateAnswer(String answer) {
    setState(() {
      controller.submit(answer);
    });
  }

  void reset(){
    setState(() {
      controller.reset();

    });
  }

  QuizPageState(){
    _questions = controller.quiz;
  }
}
