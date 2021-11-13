import 'package:flutter/material.dart';

const double titleFontSize = 20;
const double btnInsidePadding = 10;
const int answersAmount = 4;
const Color normalColor = Colors.indigo;
const Color highLightColor = Colors.blue;
const Color correctAnswer = Colors.green;
const Color incorrectAnswer = Colors.red;


/// Text of the question type : Chief town from Region. Replace  "%%" by the region name.
const String question_chiefTown = "Quel est le chef lieu de la région '%%' ?";

/// Text of the question type : Region name from chief town. Replace  "%%" by the chief town.
const String question_region = "Dans quelle région se situe %% ?";