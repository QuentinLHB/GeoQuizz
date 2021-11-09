import 'question.dart';
  import 'dart:math';



abstract class QuestionFactory{

  static const regions = {
    "Hauts-de-France" : "Lille",
    "Ile-de-France" : "Paris",
    "Auvergne-Rhône-Alpes" : "Lyon",
    "Bourgogne-Franche-Comté" : "Dijon",
    "Bretagne" : "Rennes",
    "Centre-Val de Loire" : "Orléans",
    "Corse" : "Ajaccio",
    "Grand-Est" : "Strasbourg",
    "Normandie" : "Rouen",
    "Nouvelle-Aquitaine" : "Bordeaux",
    "Occitanie" : "Toulouse",
    "Pays de la Loire" : "Nantes",
    "Provence-Alpes-Côte d'Azur" : "Marseille",
  };

  static List<String> _getAllRegions(){
    List<String> list = [];
    regions.forEach((k,v) => list.add(k));
    return list;
  }

  static List<String> _getAllChefsLieux(){
    List<String> list = [];
    regions.forEach((k,v) => list.add(v));
    return list;
  }

  /// Generates a Question and its answers (1 right 3 wrong ones)
  static List<Question> generateQuestions(int amount){
    // Validates the amount
    if(amount > regions.length) amount = regions.length;

    // Extracts Regions and chefs lieux in order to have indexes for each in a list.
    var allRegions = _getAllRegions();
    var allChefsLieu = _getAllChefsLieux();

    // List of questions
    List<Question> questions = [];

    // Creates list of indexes, in order to remove each used index from the list and avoids redundant entries.
    List<int> regionIndexes = [];
    for(int i = 0 ; i < allRegions.length ; i++){
      regionIndexes.add(i);
    }

    for(int q = 0; q < amount ; q++) {

      // Picks a random region from the list and removes its index so it isn't chosen again later
      Random random = Random();
      int randomIndex = regionIndexes[random.nextInt(
          regionIndexes.length)];
      String randomRegion = allRegions[randomIndex];
      regionIndexes.remove(randomIndex);

      var rightAnswer = regions[randomRegion] as String;
      List<String> answers = [rightAnswer];
      while (answers.length < 4) {
        var wrongAns = allChefsLieu[random.nextInt(allChefsLieu.length)];
        if (!answers.contains(wrongAns)) {
          answers.add(wrongAns);
        }
      }
      String questionString = _generateQuestionString('chef_lieu', randomRegion);
      answers.shuffle();
      questions.add(Question('chef_lieu', questionString, answers, rightAnswer, textToHighLight: ["chef lieu", randomRegion]));
    }
    return questions;
  }

  static String _generateQuestionString(String type, String lieuQuestion){
    if(type == "chef_lieu"){

      return "Quel est le chef lieu du département '$lieuQuestion' ?";
    }
    return "error";
  }
}