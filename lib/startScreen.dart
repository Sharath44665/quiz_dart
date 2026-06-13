import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void startQuiz(int num) {
    // print(id);
    final randomNum = Random();
    final pool = List<Question>.from(allQuestions);
    pool.shuffle(randomNum);
    final selected = pool.take(num).toList();
    // print(selected);
    // need to add startQuiz logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz - Start")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              "How many questions would you like to take?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => startQuiz(3),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blueAccent, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.workspaces,
                          size: 30,
                          color: const Color.fromARGB(255, 244, 98, 30),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "3",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () => startQuiz(5),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blueAccent, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.face_retouching_natural,
                          size: 30,
                          color: const Color.fromARGB(255, 118, 135, 148),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "5",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () => startQuiz(10),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blueAccent, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.emoji_events,
                          size: 30,
                          color: const Color(0xFFFFCD00),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "10",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
