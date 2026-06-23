import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/startScreen.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<int> userSelected;
  final int score = 3;
  final int qLength = 5;

  const ResultScreen({
    super.key,
    required this.questions,
    required this.userSelected,
  });

  int get scoreData {
    int score = 0;
    for (var idx = 0; idx < questions.length; idx += 1) {
      if (userSelected[idx] == questions[idx].correctIndex) {
        score += 1;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "You Scored $scoreData out of ${questions.length}",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (_, index) {
                  final questionData = questions[index];
                  final selected = userSelected[index];
                  final correct = questionData.correctIndex;
                  return Card(
                    child: ListTile(
                      title: Text(questionData.question),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            "your Answer: ${selected == -1 ? 'No Answer' : questionData.options[selected]}",
                            style: TextStyle(
                              color: selected == correct
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          Text(
                            "Correct answer: ${questionData.options[correct]}",
                          ),
                          Text("Explanation: ${questionData.explanation}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const StartScreen()),
                );
              },
              label: Text("Restart"),
              icon: Icon(Icons.restart_alt),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
