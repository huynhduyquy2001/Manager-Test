import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

int getNO(int number) {
  return number + 1;
}

List<CurrentAnswerStruct> getQuestions(List<QuestionStruct> questions) {
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

List<CurrentAnswerStruct> getAnswers(
  List<String> answers,
  List<CurrentAnswerStruct> currentAnswer,
) {
  // Duyệt qua từng phần tử trong danh sách answers và cập nhật currentAnswer tương ứng
  for (int i = 0; i < answers.length; i++) {
    currentAnswer[i].answer =
        answers[i]; // Gán trực tiếp nếu currentAnswer có thể thay đổi
  }

  // Trả về danh sách currentAnswer đã được cập nhật
  return currentAnswer;
}

List<String>? createEmptyList() {
  return List<String>.filled(4, '', growable: false);
}

List<String>? createNotEmptyList(
  String? string1,
  String? string2,
  String? string3,
  String? string4,
) {
  return [string1 ?? '', string2 ?? '', string3 ?? '', string4 ?? ''];
}

List<TestRecord> findPromotedTests(
  List<TestRecord> allTest,
  List<int> selectedTestsIndex,
) {
  // Return allTest based on selectedTestsIndex
  List<TestRecord> promotedTests = [];
  for (int i = 0; i < selectedTestsIndex.length; i++) {
    int index = selectedTestsIndex[i];
    if (index >= 0 && index < allTest.length) {
      TestRecord test = allTest[index];
      promotedTests.add(test);
    }
  }
  return promotedTests;
}

int getNumberOfInCorrectAnswers(
  List<CurrentAnswerStruct> currentAnswers,
  List<QuestionStruct> currentQuestions,
) {
  int correctCount = 0;

  for (int i = 0; i < currentAnswers.length; i++) {
    if (currentQuestions[i].type == "Multiple choice" &&
        currentAnswers[i].answer != currentQuestions[i].answer) {
      correctCount++;
    }
  }
  return correctCount;
}

int getNumberofEssayQuestions(List<QuestionStruct> currentQuestions) {
  return currentQuestions
      .where((question) => question.type != "Multiple choice")
      .length;
}

List<QuestionStruct>? removeQuestionFromList(
  int index,
  List<QuestionStruct> list,
) {
  // Check if the index is valid
  if (index >= 0 && index < list.length) {
    // Create a copy of the list to avoid modifying the original
    List<QuestionStruct> updatedList = List.from(list);

    // Remove the question at the specified index
    updatedList.removeAt(index);

    return updatedList;
  }

  // Return null if the index is invalid
  return null;
}

String getQuestionID(String number) {
  // Lấy thời gian hiện tại
  final now = DateTime.now();

  // Định dạng thời gian thành chuỗi ngày/tháng/năm giờ:phút:giây
  final formattedDate = DateFormat('yyyyMMddHHmmss').format(now);

  return '$formattedDate$number';
}

List<QuestionStruct>? sortQuestionList(List<QuestionStruct>? currentList) {
  if (currentList == null) return null;

  currentList.sort((a, b) => a.index.compareTo(b.index));
  return currentList;
}

int getNumberOfCorrectAnswers(
  List<CurrentAnswerStruct> currentAnswers,
  List<QuestionStruct> currentQuestions,
) {
  int correctCount = 0;

  for (int i = 0; i < currentAnswers.length; i++) {
    // Check if the question type is "Multiple choice" and the answers match
    if (currentQuestions[i].type == "Multiple choice" &&
        currentAnswers[i].answer == currentQuestions[i].answer) {
      correctCount++;
    }
  }
  return correctCount;
}
