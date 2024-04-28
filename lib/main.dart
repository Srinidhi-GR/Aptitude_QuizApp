import 'package:aptitude_quizz_app/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';
import 'auth/registration_screen.dart';
import 'constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoggedIn = false;

  checkLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null && mounted) {
          setState(
            () {
              isLoggedIn = true;
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login_page': (context) => const LoginPage(),
        'registration_screen': (context) => const RegistrationScreen(),
        'home_page': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      color: kBgClr,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto-Bold'),
          bodyMedium: TextStyle(fontFamily: 'Roboto-Bold'),
          // Add other text styles if needed
        ),
      ),
      home: isLoggedIn == true ? const HomePage() : const LoginPage(),
    );
  }
}
