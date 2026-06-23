import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/resultScreen.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  const QuizScreen({super.key, required this.questions});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final int total;
  int currentIdx = 0;
  late List<int> userSelected;
  late List<bool> checked;
  late bool flagNextPrev = false;

  @override
  void initState() {
    super.initState();
    total = widget.questions.length;
    userSelected = List.filled(total, -1);
    checked = List.filled(total, false);
    // print(total);
  }

  void showWarning(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        backgroundColor: Colors.amber.shade300,
        content: const Text(
          'Warning: You reached Limit',
          style: TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        // optional: action to close early
        action: SnackBarAction(
          label: "Close",
          textColor: Colors.black,
          onPressed: () => messenger.hideCurrentSnackBar(),
        ),
      ),
    );
    return;
  }

  void checkAnswer() {
    // if (userSelected[currentIdx] == -1) {
    // show correct answer explanation regardless of any choice
    setState(() {
      checked[currentIdx] = true;
    });

    return;
    // }
  }

  void next(BuildContext context) {
    if (currentIdx < total - 1) {
      setState(() {
        currentIdx += 1;
      });
      flagNextPrev = false;
    } else {
      flagNextPrev = true;
    }
    if (flagNextPrev) {
      showWarning(context);
    }
  }

  void previous(BuildContext context) {
    if (currentIdx > 0) {
      setState(() {
        currentIdx -= 1;
      });
      flagNextPrev = false;
    } else {
      flagNextPrev = true;
    }

    if (flagNextPrev) {
      showWarning(context);
    }
  }

  void finishEvent() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          questions: widget.questions,
          userSelected: userSelected,
        ),
      ),
    );
  }

  void selectOption(int idx) {
    setState(() {
      userSelected[currentIdx] = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[currentIdx];
    final selected = userSelected[currentIdx];
    final isChecked = checked[currentIdx];
    final correct = q.correctIndex;

    Color? optionColor(int idx) {
      if (!isChecked) {
        return (selected == idx) ? Colors.blue.shade100 : null;
      }

      if (idx == correct) return Colors.green.shade200;
      if (idx == selected && selected != correct) return Colors.red;
      return null;
    }

    Icon? optionIcon(int idx) {
      if (!isChecked) {
        if (selected == idx) return const Icon(Icons.radio_button_checked);
        return const Icon(Icons.radio_button_off);
      }
      if (idx == correct) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
      if (idx == selected && selected != correct) {
        return const Icon(Icons.cancel, color: Colors.red);
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Question ${currentIdx + 1} of $total")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight - 40,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  q.question,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...List.generate(4, (i) {
                  return Card(
                    color: optionColor(i),
                    child: ListTile(
                      leading: optionIcon(i),
                      title: Text(q.options[i]),
                      onTap: () {
                        if (!isChecked) selectOption(i);
                      },
                    ),
                  );
                }),

                const Spacer(),

                if (isChecked) ...[
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
                          userSelected[currentIdx] == q.correctIndex
                              ? "✅ Correct"
                              : " ❌ Incorrect",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: userSelected[currentIdx] == q.correctIndex
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("Explanation: ${q.explanation}"),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => previous(context),
                            label: Text("Previous"),
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: checkAnswer,
                            label: Text("Check answer"),
                            icon: Icon(Icons.lightbulb),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => {next(context)},
                            label: Text("Next"),
                            iconAlignment: IconAlignment.end,
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: finishEvent,
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(
                        BorderSide(color: Colors.red),
                      ),
                    ),
                    label: Text("finish"),
                    icon: Icon(Icons.stop_circle, color: Colors.red),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
