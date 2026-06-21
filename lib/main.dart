import 'package:flutter/material.dart';
import 'package:quiz_app/quizScreen.dart';
import 'package:quiz_app/resultScreen.dart';
import 'package:quiz_app/startScreen.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz app",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: const QuizScreen(),
    );
  }
}
