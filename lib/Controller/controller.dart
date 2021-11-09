import 'package:flutter/cupertino.dart';
import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/Model/question_factory.dart';
import 'package:flutter_project/View/main.dart';

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





  // Methods

  /// Returns true if the answer passed as argument is the right one.
  bool isRight(String answer){
    return currentQuestion.submit(answer);
  }

  void submit(bool answeredRight){
    _currentIndex++;
    if(answeredRight) _score++;
  }

  void reset() {
    _score = 0;
    _currentIndex = 0;
    _quiz = QuestionFactory.generateQuestions(QUESTION_AMOUNT);
  }



}