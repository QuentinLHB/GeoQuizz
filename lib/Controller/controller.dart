import 'package:flutter_project/Model/question.dart';
import 'package:flutter_project/Model/question_factory.dart';

class Controller{

  // Singleton Controller generation

  static final Controller _controller = Controller._privateConstructor();

  Controller._privateConstructor();

  factory Controller() {
    return _controller;
  }

  // Fields
  List<Question> _quiz = [];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Methods

  /// Returns a list of question. The quiz is only generated if it hasn't been initialized yet.
  List<Question> getQuiz(){
    if(_quiz.isEmpty){
      _quiz = QuestionFactory.generateQuestions(10);
    }
    return _quiz;
  }

  void incrementIndex(){
    _currentIndex++;
  }

  Question getCurrentQuestion(){
    return _quiz[_currentIndex];
  }

  bool submit(String answer){
    return getCurrentQuestion().submit(answer);
  }

}