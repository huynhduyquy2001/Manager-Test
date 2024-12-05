// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<CurrentAnswerStruct>> getQuestionList(
    List<QuestionStruct> questions) async {
  // Initialize an empty list to store CurrentAnswerStruct objects
  List<CurrentAnswerStruct> currentAnswers = [];

  // Iterate over each question in the input list
  for (var question in questions) {
    // Create a CurrentAnswerStruct with question title and empty answer
    var currentAnswer = CurrentAnswerStruct(
      question:
          question.title, // Set the question field to the title of the question
      answer: '', // Leave answer field empty
    );

    // Add the newly created CurrentAnswerStruct to the list
    currentAnswers.add(currentAnswer);
  }

  // Return the list of CurrentAnswerStruct objects
  return currentAnswers;
}
