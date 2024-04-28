import 'package:aptitude_quizz_app/auth/firebase_services.dart';
import 'package:aptitude_quizz_app/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  'Hello there!',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
                const Text(
                  'Good to see you back',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    ctrl: _email, txt: "Enter your email", obscureCond: false),
                const SizedBox(height: 10),
                CustomTextField(
                    ctrl: _password, txt: 'Enter password', obscureCond: true),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      forgotPassword(email: _email.text, context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: btnClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                CustomButton1(
                    btnName: 'Sign In',
                    function: () async {
                      await signIn(
                          email: _email.text,
                          password: _password.text,
                          context: context,
                          navigator: Navigator.of(context));
                    }),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'registration_screen');
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: btnClr,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
