import 'package:flutter/cupertino.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/Model/question_factory.dart';
import 'package:flutter_project/View/Home/main.dart';

class Controller{

  // Singleton Controller generation

  static final Controller _controller = Controller._privateConstructor();

  Controller._privateConstructor();

  factory Controller() {
    return _controller;
  }

  // Fields
  static const int QUESTION_AMOUNT = 10;
  List<Question> _quiz = [];
  List<Question> get quiz {
    if(_quiz.isEmpty){
      _quiz = QuestionFactory.generateQuestions(QUESTION_AMOUNT);
    }
    return _quiz;
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  Question get currentQuestion => _quiz[_currentIndex];

  int _score = 0;
  int get score => _score;

  /// Returns quiz's status, i.e. "Quizz : Question 2/10"
  String get quizStatus {
    if(currentIndex <= quiz.length-1) return "Quizz : Question " + (currentIndex+1).toString() + " / " + quiz.length.toString();
    return "Résultats";
  }


  // Methods

  /// Returns true if the answer passed as argument is the right one.
  bool isRight(){
    return currentQuestion.isUserRight;
  }

  bool isAnswerRight(Question question, String answer){
    return question.isAnswerRigh(answer);
  }

  void submit(String answer){
    currentQuestion.submit(answer);
    if(currentQuestion.isUserRight) _score++;
    _currentIndex++;
  }

  void reset() {
    _score = 0;
    _currentIndex = 0;
    _quiz = QuestionFactory.generateQuestions(QUESTION_AMOUNT);
  }



}