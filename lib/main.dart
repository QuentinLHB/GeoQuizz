import 'package:flutter/material.dart';
import 'package:flutter_project/answer_widget.dart';
import 'package:flutter_project/result.dart';
import './question_widget.dart';
import './quiz_keys_enum.dart';
import './quiz.dart';

void main() {
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

  final _questions = const [
    {
      QuizKeys.question: "Quelle est la capitale de la France ?",
      QuizKeys.allAnswers: ["Paris", "Berlin", "Lille"],
      QuizKeys.rightAnswer: "Paris",
    },
    {
      QuizKeys.question: "Quel est le chef-lieu des Hauts-de-France ?",
      QuizKeys.allAnswers: ["Lyon", "Monaco", "Lille"],
      QuizKeys.rightAnswer: "Lille",
    }
  ];

  int _currentIndex = 0;
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
          body: _currentIndex < _questions.length
              ? QuizzWidget(_questions, validateAnswer, _currentIndex)
              : ResultWidget(_score, _questions.length)
        ));
  }

  void validateAnswer(bool right) {
    setState(() {
      if(right) _score++;
      _currentIndex++;
    });

    print("done !");
  }
}
