import 'package:aptitude_quizz_app/auth/firebase_services.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome!',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
                const Text(
                  'Let\'s create an account for you',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    ctrl: _emailController,
                    txt: "Enter your email",
                    obscureCond: false),
                const SizedBox(height: 10),
                CustomTextField(
                    ctrl: _passwordController,
                    txt: 'Enter password',
                    obscureCond: true),
                const SizedBox(height: 45),
                CustomButton1(
                    btnName: 'Sign Up',
                    function: () async {
                      await signUp(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context,
                        navigator: Navigator.of(context),
                      );
                    }),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member? ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'login_screen');
                      },
                      child: Text(
                        'Login In',
                        style: TextStyle(
                            color: btnClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
