import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';

void main() {
  runApp(const Oktibar());
}

class Oktibar extends StatelessWidget {
  const Oktibar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 231, 225),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 88, 134, 112),
          title: const Text('Ikhtibar'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Exampage(),
        ),
      ),
    );
  }
}

class Exampage extends StatefulWidget {
  const Exampage({super.key});

  @override
  State<Exampage> createState() => _ExampageState();
}

class _ExampageState extends State<Exampage> {
  List<Widget> answerResults = [];
  int j = 1; // Used for image names
  Appbrain appbrain = Appbrain();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = appbrain.getanser();

    setState(() {
      answerResults.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            userAnswer == correctAnswer ? Icons.thumb_up : Icons.thumb_down,
            color: userAnswer == correctAnswer ? Colors.green : Colors.red,
          ),
        ),
      );
    });

    if (appbrain.isLastQuestion()) {
      // Show Alert when the last question is completed
      Alert(
        context: context,
        title: "Test Completed",
        desc: "You have reached the end of the test.",
        buttons: [
          DialogButton(
            child: const Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                appbrain.reset(); // Reset the quiz
                answerResults.clear(); // Clear results
                j = 1; // Reset images
              });
              Navigator.pop(context);
            },
            color: Colors.green,
          )
        ],
      ).show();
    } else {
      // Move to the next question
      setState(() {
        appbrain.nextquestion();
        j++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: answerResults),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/$j.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                appbrain.getQuestiontext(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
            ),
            onPressed: () => checkAnswer(true),
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
          flex: 1,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
            ),
            onPressed: () => checkAnswer(false),
            child: const Text(
              'No',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
