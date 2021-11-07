import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';

class QuestionWidget extends StatelessWidget {
  String text;

  QuestionWidget(this.text){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: Colors.indigo, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
    );
  }
}
