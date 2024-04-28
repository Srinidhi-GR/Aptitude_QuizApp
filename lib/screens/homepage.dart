import 'package:aptitude_quizz_app/constants.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:aptitude_quizz_app/screens/difficulty_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void difficultySelectorCallback(
    {required BuildContext context, required int id}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DifficultySelectionPage(
                topicId: id,
              )));
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: kBgClr,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: btnClr,
                        borderRadius: const BorderRadiusDirectional.vertical(
                            bottom: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, bottom: 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Hello there!',
                              style: TextStyle(color: widgetClr),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'What subject do you want to improve today?',
                                    style: GoogleFonts.oswald(
                                        fontSize: 20, color: widgetClr),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/home_page.png')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTile(
                    icon1: Icons.filter_9_plus,
                    icon2: Icons.percent,
                    txt1: 'Numbers',
                    txt2: 'Percentage',
                    function1: () => difficultySelectorCallback(
                      context: context,
                      id: 0,
                    ),
                    function2: () => difficultySelectorCallback(
                      context: context,
                      id: 1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTile(
                    icon1: Icons.attach_money,
                    icon2: Icons.exposure_zero,
                    txt1: "Profit and Loss",
                    txt2: 'Average',
                    function1: () => difficultySelectorCallback(
                      context: context,
                      id: 2,
                    ),
                    function2: () => difficultySelectorCallback(
                      context: context,
                      id: 3,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTile(
                    icon1: Icons.scale,
                    icon2: Icons.directions_run,
                    txt1: 'Ratio and Proportion',
                    txt2: 'Time and distance',
                    function1: () => difficultySelectorCallback(
                      context: context,
                      id: 4,
                    ),
                    function2: () => difficultySelectorCallback(
                      context: context,
                      id: 5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTile(
                    icon1: Icons.work,
                    icon2: Icons.money_off,
                    txt1: 'Time and Work',
                    txt2: 'Simple Interest',
                    function1: () => difficultySelectorCallback(
                      context: context,
                      id: 6,
                    ),
                    function2: () => difficultySelectorCallback(
                      context: context,
                      id: 7,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTile(
                    icon1: Icons.monetization_on,
                    icon2: Icons.shuffle,
                    txt1: 'Compound Interest',
                    txt2: 'Permutation and Combination',
                    function1: () => difficultySelectorCallback(
                      context: context,
                      id: 8,
                    ),
                    function2: () => difficultySelectorCallback(
                      context: context,
                      id: 9,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
