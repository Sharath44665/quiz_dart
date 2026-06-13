import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final int total;
  int currentIdx = 0;
  @override
  void initState() {
    super.initState();
    total = 3;
    print(total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Question ${currentIdx + 1} of $total")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("demo question", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Card(
              color: Colors.blue.shade100,
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text("demo option 1"),
                onTap: () {},
              ),
            ),
            for (var idx = 0; idx < total; idx += 1)
              Card(
                color: const Color.fromARGB(255, 252, 254, 255),
                child: ListTile(
                  leading: Icon(Icons.radio_button_off),
                  title: Text("demo option $idx"),
                  onTap: () {},
                ),
              ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "incorrect!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Explanation: Use a for loop to build a list of Card widgets and place them in the Scaffold body (e.g., in a Column or ListView). Example that creates three similar cards with text \"demo option 1\", \"demo option 2\", \"demo option 3\"",
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Previous"),
                          icon: Icon(Icons.arrow_back),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Check answer"),
                          icon: Icon(Icons.lightbulb),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Next"),
                          iconAlignment: IconAlignment.end,
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(
                        BorderSide(color: Colors.red),
                      ),
                    ),
                    label: Text("finish"),
                    icon: Icon(Icons.stop_circle, color: Colors.red),
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
