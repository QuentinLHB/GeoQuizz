import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';
import 'package:flutter_project/View/constants.dart';
import 'package:flutter_project/tools/tools.dart';
import 'package:flutter_project/View/constants.dart' as constants;

class QuestionWidget extends StatelessWidget {
  String text;
  List<String> textToHighlight = [];
  var textSpans = <TextSpan>[];

  QuestionWidget(this.text, {this.textToHighlight: const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Tools.richTextBuilder(
          context,
          text,
          textToHighlight: textToHighlight,
          fontSize: 20,
          normalColor: constants.normalColor,
          highlightColor: constants.highLightColor,
          textAlign: TextAlign.center,
        ),
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, bottom: 25),
    );
  }
}
