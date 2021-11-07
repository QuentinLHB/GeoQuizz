class Question{


  String type;
  List<String> allAnswers;
  String rightAnswer;
  String question;

  Question(this.type, this.question, this.allAnswers, this.rightAnswer);

  bool submit(String answer){
    return answer == rightAnswer;
  }


}