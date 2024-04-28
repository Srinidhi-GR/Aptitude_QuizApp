import 'package:aptitude_quizz_app/constants.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:aptitude_quizz_app/screens/quiz_page.dart';
import 'package:flutter/material.dart';

import '../auth/firebase_services.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key, required this.results, required this.totalQuestions});

  final int results;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: widgetClr,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Test completed',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          results > totalQuestions / 2.round()
                              ? 'assets/images/result_image.png'
                              : 'assets/images/result_image2.png',
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          'You scored $results out of $totalQuestions',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          results > totalQuestions / 2.round()
                              ? 'Good job you did great!'
                              : 'Don\'t worry you can always get better!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton1(
                    btnName: 'Retry test',
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  QuizPage(questionList: questionList)));
                    }),
                const SizedBox(height: 10),
                CustomButton1(
                    btnName: 'Return home',
                    function: () {
                      Navigator.popAndPushNamed(context, 'home_page');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
