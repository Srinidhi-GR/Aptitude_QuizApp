import 'package:aptitude_quizz_app/auth/firebase_services.dart';
import 'package:aptitude_quizz_app/constants.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:aptitude_quizz_app/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DifficultySelectionPage extends StatefulWidget {
  const DifficultySelectionPage({super.key, required this.topicId});

  final int topicId;

  @override
  State<DifficultySelectionPage> createState() =>
      _DifficultySelectionPageState();
}

void getQuestions(
    {required context, required topicID, required selectedDifficulty}) async {
  try {
    await getData(topicID: topicID, selectedDifficulty: selectedDifficulty);
  } catch (e) {
    SnackBar(
      content: Text(e.toString()),
    );
  }
  // ignore: unnecessary_null_comparison
  if (questionList != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => QuizPage(
          questionList: questionList,
        ),
      ),
    );
  } else {
    const SnackBar(content: Text('Error loading questions'));
  }
}

class _DifficultySelectionPageState extends State<DifficultySelectionPage> {
  late String _selectedDifficulty = 'Easy';
  late bool _isSelected1 = false;
  late bool _isSelected2 = false;
  late bool _isSelected3 = false;
  late bool _optionSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'Choose your difficulty',
                  style: GoogleFonts.oswald(fontSize: 37),
                ),
              ),
              CustomRadioTile(
                isSelected1: _isSelected1,
                selectedDifficulty: _selectedDifficulty,
                btnTxt: 'easy',
                onChanged: (String? value) {
                  setState(() {
                    _selectedDifficulty = value!;
                    _isSelected1 = true;
                    _isSelected2 = false;
                    _isSelected3 = false;
                    _optionSelected = true;
                  });
                },
              ),
              CustomRadioTile(
                isSelected1: _isSelected2,
                selectedDifficulty: _selectedDifficulty,
                btnTxt: 'intermediate',
                onChanged: (String? value) {
                  setState(() {
                    _selectedDifficulty = value!;
                    _isSelected1 = false;
                    _isSelected2 = true;
                    _isSelected3 = false;
                    _optionSelected = true;
                  });
                },
              ),
              CustomRadioTile(
                isSelected1: _isSelected3,
                selectedDifficulty: _selectedDifficulty,
                btnTxt: 'advanced',
                onChanged: (String? value) {
                  setState(() {
                    _selectedDifficulty = value!;
                    _isSelected1 = false;
                    _isSelected2 = false;
                    _isSelected3 = true;
                    _optionSelected = true;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: CustomButton1(
                      btnName: 'Continue to quiz',
                      function: () {
                        _optionSelected == false
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Center(child: Text('Warning')),
                                    content: const Center(
                                      child: Text(
                                          'Please select a difficulty level!'),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                })
                            : getQuestions(
                                context: context,
                                topicID: widget.topicId,
                                selectedDifficulty: _selectedDifficulty,
                              );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
