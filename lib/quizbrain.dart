import 'package:aptitude_quizz_app/screens/results_page.dart';
import 'package:flutter/material.dart';

int checkAnswers(
    {required questionList,
    required selectedAnswers,
    required correctAnswers}) {
  for (int i = 0; i < questionList.length; i++) {
    if (selectedAnswers[i] == questionList[i]['correct_answer']) {
      correctAnswers++;
    }
  }
  return correctAnswers;
}

class QuizBrain {
  QuizBrain({
    required this.navigator,
    required this.questionListLength,
    required this.questionList,
  });

  final int questionListLength;
  String selectedValue = 'option1';
  final List selectedAnswers = [];
  final List questionList;
  int correctAnswers = 0;
  late int questionNum = 0;
  final NavigatorState navigator;
  late bool optionSelected;

  List addAnswers() {
    selectedAnswers.add(selectedValue);
    return selectedAnswers;
  }

  dynamic incrementQuestion() {
    if (questionNum < (questionListLength - 1)) {
      questionNum++;
      return questionNum;
    } else {
      var nav = navigator.pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => ResultsPage(
            results: checkAnswers(),
            totalQuestions: questionListLength,
          ),
        ),
      );
      return nav;
    }
  }

  int checkAnswers() {
    for (int i = 0; i < questionListLength; i++) {
      if (selectedAnswers[i] == questionList[i]['correct_answer']) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }
}
