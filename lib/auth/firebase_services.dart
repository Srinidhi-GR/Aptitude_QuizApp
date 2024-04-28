import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

late List questionList;

Future signUp({
  required String email,
  required String password,
  required BuildContext context,
  required NavigatorState navigator,
}) async {
  await _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signed up successfully'))),
            navigator.popAndPushNamed('home_page'),
          })
      .onError((error, stackTrace) => {
            if (error is FirebaseAuthException)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.code.toString()),
                  ),
                ),
              }
          });
}

Future signIn({
  required String email,
  required String password,
  required BuildContext context,
  required NavigatorState navigator,
}) async {
  await _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logged in successfully'),
              ),
            ),
            navigator.popAndPushNamed('home_page'),
          })
      .onError((error, stackTrace) => {
            if (error is FirebaseAuthException)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.code.toString()),
                  ),
                ),
              },
          });
}

Future getData({required topicID, required selectedDifficulty}) async {
  try {
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child('topic/topic$topicID/$selectedDifficulty');
    final dbSnapshot = await dbRef.once();
    questionList = dbSnapshot.snapshot.value as List<dynamic>;
  } catch (e) {
    return e;
  }
}

Future<void> forgotPassword({
  required String email,
  required BuildContext context,
}) async {
  try {
    await _auth.sendPasswordResetEmail(email: email).then(
          (value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset mail has been sent'),
              ),
            ),
          },
        );
  } catch (error) {
    if (error is FirebaseAuthException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.code.toString()),
        ),
      );
    }
  }
}
