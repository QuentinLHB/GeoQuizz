class Question{


  String type;
  List<String> allAnswers;
  String rightAnswer;
  String question;
  List<String> textToHighLight = [];

  Question(this.type, this.question, this.allAnswers, this.rightAnswer, {this.textToHighLight = const[]});

  bool submit(String answer){
    return answer == rightAnswer;
  }


}