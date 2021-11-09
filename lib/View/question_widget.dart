import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/View/constants.dart';

class QuestionWidget extends StatelessWidget {
  String text;
  List<String> textToHighlight =[];
  var textSpans = <TextSpan>[];

  QuestionWidget(this.text, {this.textToHighlight : const[]}){


    textToHighlight.forEach((element) {

      // Adds the part coming before the highlighted text :
      var splittedText = text.split(element);
      textSpans.add(TextSpan(
        text: splittedText[0],
        style: TextStyle(color: Colors.indigo, fontSize: 20),
      ));

      // Adds the highlighted text.
      textSpans.add(TextSpan(
        text:element,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: titleFontSize,
        ),
      ));
      text = text.replaceAll(splittedText[0], "");
      text = text.replaceAll(element, "");

    });
    if(textToHighlight.isNotEmpty) {
      textSpans.add(TextSpan(
        text: text, // Remaining text after everything else was removed
        style: TextStyle(color: Colors.indigo, fontSize: 20),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
          text:TextSpan(
            children: textSpans
          ),
            textAlign: TextAlign.center,
        ),
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(top:15, bottom:25),
    );
  }
}
