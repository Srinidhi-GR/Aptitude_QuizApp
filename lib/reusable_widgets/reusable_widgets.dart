import 'package:aptitude_quizz_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.ctrl,
      required this.txt,
      required this.obscureCond});

  final TextEditingController ctrl;
  final String txt;
  final bool obscureCond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widgetClr,
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
            ),
            obscureText: obscureCond,
          ),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {super.key, required this.btnName, required this.function});

  final String btnName;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: btnClr, borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              btnName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: widgetClr, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.txt1,
    required this.txt2,
    required this.function1,
    required this.function2,
  });

  final IconData icon1;
  final IconData icon2;
  final String txt1;
  final String txt2;
  final VoidCallback function1;
  final VoidCallback function2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: function1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: widgetClr, borderRadius: BorderRadius.circular(9)),
                child: Column(
                  children: [
                    Icon(
                      icon1,
                      size: 30,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      txt1,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pathwayGothicOne(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: function2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: widgetClr, borderRadius: BorderRadius.circular(9)),
                child: Column(
                  children: [
                    Icon(
                      icon2,
                      size: 30,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      txt2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pathwayGothicOne(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRadioTile extends StatefulWidget {
  CustomRadioTile({
    super.key,
    required this.isSelected1,
    required this.selectedDifficulty,
    required this.btnTxt,
    required this.onChanged,
  });

  late final bool isSelected1;
  late final String selectedDifficulty;
  late final String btnTxt;
  final ValueChanged<String?> onChanged;
  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected1 == true ? btnClr : widgetClr,
        ),
        child: RadioListTile(
          activeColor: widget.isSelected1 == true ? widgetClr : btnClr,
          title: Text(widget.btnTxt,
              style: TextStyle(
                  color: widget.isSelected1 == true ? widgetClr : btnClr)),
          value: widget.btnTxt,
          groupValue: widget.selectedDifficulty,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
