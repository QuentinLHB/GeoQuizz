import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/Model/question_factory.dart';
import 'package:flutter_project/View/question_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_project/View/Home/main.dart';

void main(){
  group("Quiz", (){
    var questions = QuestionFactory.generateQuestions(10);
    var q = questions[0];
    test("There should be 10 questions", (){
      expect(questions.length, 10);
    });

    test("There are 4 answers", (){
      expect(q.allAnswers.length, 4);
    });

    test("The right answer is contained in the available answers", (){
      expect(q.allAnswers.contains(q.rightAnswer), true);
    });

    test("Submit works", (){
      expect(q.submit(q.rightAnswer), true);
    });

  });

  group("Controller", (){
    var c = Controller();

    test("Creates quizz", (){
      var quizz = c.quiz;
      expect(quizz.isNotEmpty, true);
    });

    test("Score and index increase", (){
      int scoreBefore = c.score;
      int indexBefore = c.currentIndex;
      // c.submit(true); à remplacer
      expect(c.score != scoreBefore, true);
      expect(c.currentIndex != indexBefore, true);
    });
  });

  group("Test des widgets", (){

    testWidgets("Contenu du widget Question", (WidgetTester tester) async {
      var questionWidget = QuestionWidget("Quelle est la capitale de la France ?");
      await tester.pumpWidget(questionWidget);
      final richtext = find.descendant(of: find.byWidget(questionWidget), matching: find.byType(RichText));
      expect(richtext, findsOneWidget);
    });
  });
}