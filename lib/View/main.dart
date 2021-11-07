import 'package:flutter/material.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/Model/question_factory.dart';
import 'package:flutter_project/View/answer_widget.dart';
import 'package:flutter_project/View/quiz_keys_enum.dart';
import 'package:flutter_project/View/result.dart';
import 'question_widget.dart';
import 'quiz_widget.dart';
import 'package:flutter_project/Controller/controller.dart';

void main() {

  var qs = QuestionFactory.generateQuestions(10);

  qs.forEach((question) {
    print(question.question);
    print(question.allAnswers);
    print(question.rightAnswer);
  });

  runApp(MyApp());
}



  class MyApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
      return MyAppState();
    }
  }

  class MyAppState extends State<MyApp> {
    // This widget is the root of your application.


    var controller = Controller();

    List<Question> _questions = [];

    int _score = 0;

    @override
    Widget build(BuildContext context) {



      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(title: const Text("Quizz")),
            body: controller.currentIndex < _questions.length
                ? QuizzWidget(validateAnswer, controller.currentIndex)
                : ResultWidget(_score, _questions.length)
          ));
    }

    void validateAnswer(bool right) {
      setState(() {
        if(right) _score++;
        controller.incrementIndex();
      });
    }

    MyAppState(){
      _questions = controller.getQuiz();
    }
}
