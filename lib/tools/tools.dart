import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Tools{

  static RichText richTextBuilder(BuildContext context, String initialText,
      {List<String> textToHighlight : const[],
        double fontSize: 16,
        Color normalColor : Colors.transparent,
        Color highlightColor : Colors.blue,
        TextAlign textAlign : TextAlign.start,
      }){
    if(normalColor == Colors.transparent){
      normalColor = Theme.of(context).textTheme.bodyText2!.color as Color;
    }

    var textSpans = <TextSpan>[];
    textToHighlight.forEach((element) {

      // Adds the part coming before the highlighted text :
      var splittedText = initialText.split(element);
      textSpans.add(TextSpan(
        text: splittedText[0],
        style: TextStyle(color: normalColor, fontSize: fontSize),
      ));

      // Adds the highlighted text.
      textSpans.add(TextSpan(
        text:element,
        style: TextStyle(
          color: highlightColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ));
      initialText = initialText.replaceAll(splittedText[0], "");
      initialText = initialText.replaceAll(element, "");

    });
    if(textToHighlight.isNotEmpty) {
      textSpans.add(TextSpan(
        text: initialText, // Remaining text after everything else was removed
        style: TextStyle(color: normalColor, fontSize: fontSize),
      ));
    }

    return RichText(
      text:TextSpan(
          children: textSpans
      ),
      textAlign: textAlign,
    );
  }
}