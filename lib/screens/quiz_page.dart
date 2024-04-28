import 'package:aptitude_quizz_app/auth/firebase_services.dart';
import 'package:aptitude_quizz_app/constants.dart';
import 'package:aptitude_quizz_app/quizbrain.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.questionList});

  final List questionList;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool optionSelected = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  late QuizBrain quizBrain;

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain(
      questionListLength: questionList.length,
      questionList: questionList,
      navigator: Navigator.of(context),
    );
  }

  void quizService() {
    if (optionSelected == true) {
      quizBrain.addAnswers();
      setState(
        () {
          quizBrain.incrementQuestion();
        },
      );
      optionSelected = false;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Please select a answer'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Center(child: Text('Warning')),
                content: const Text(
                  'Your answers will not be saved. Do you want to quit?',
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text(
                      'No',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Yes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
          backgroundColor: kBgClr,
          body: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: widgetClr,
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 185,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.questionList[quizBrain.questionNum]
                                        ['question'],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: Text(
                                '${quizBrain.questionNum + 1}/${quizBrain.questionListLength}',
                                style: TextStyle(
                                  color: btnClr,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomRadioTile(
                        isSelected1: option1,
                        selectedDifficulty: quizBrain.selectedValue,
                        btnTxt: widget.questionList[quizBrain.questionNum]
                            ['options'][0],
                        onChanged: (value) {
                          setState(() {
                            option1 = true;
                            option2 = false;
                            option3 = false;
                            option4 = false;
                            quizBrain.selectedValue = value!;
                            optionSelected = true;
                          });
                        }),
                    CustomRadioTile(
                        isSelected1: option2,
                        selectedDifficulty: quizBrain.selectedValue,
                        btnTxt: widget.questionList[quizBrain.questionNum]
                            ['options'][1],
                        onChanged: (value) {
                          setState(() {
                            option1 = false;
                            option2 = true;
                            option3 = false;
                            option4 = false;
                            quizBrain.selectedValue = value!;
                            optionSelected = true;
                          });
                        }),
                    CustomRadioTile(
                        isSelected1: option3,
                        selectedDifficulty: quizBrain.selectedValue,
                        btnTxt: widget.questionList[quizBrain.questionNum]
                            ['options'][2],
                        onChanged: (value) {
                          setState(() {
                            option1 = false;
                            option2 = false;
                            option3 = true;
                            option4 = false;
                            quizBrain.selectedValue = value!;
                            optionSelected = true;
                          });
                        }),
                    CustomRadioTile(
                        isSelected1: option4,
                        selectedDifficulty: quizBrain.selectedValue,
                        btnTxt: widget.questionList[quizBrain.questionNum]
                            ['options'][3],
                        onChanged: (value) {
                          setState(() {
                            option1 = false;
                            option2 = false;
                            option3 = false;
                            option4 = true;
                            quizBrain.selectedValue = value!;
                            optionSelected = true;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CustomButton1(
                        btnName: quizBrain.questionNum ==
                                (widget.questionList.length - 1)
                            ? 'Submit test'
                            : 'Next',
                        function: () {
                          quizService();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
