import 'package:flutter/material.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/Model/question_factory.dart';
import 'package:flutter_project/View/Quiz/quiz_page.dart';
import 'package:flutter_project/View/answer_widget.dart';
import 'package:flutter_project/View/result.dart';
import '../question_widget.dart';
import '../quiz_widget.dart';
import 'package:flutter_project/Controller/controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GeoQuiz',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: IndexPage()
        );
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeoQuizz")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => QuizPage()  ),
            );
          },
          child: Text("Vers le quizz"),
        ),
      ),
    );
  }
}



