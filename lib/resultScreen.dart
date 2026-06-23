import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "You Scored $score out of $qLength",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("some question data"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            "your Answer: you selected/not answered/change color",
                            style: TextStyle(color: Colors.blue.shade700),
                          ),
                          Text("display correct answer"),
                          Text("show explanation"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
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
