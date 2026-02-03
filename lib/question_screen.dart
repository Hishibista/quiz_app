import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.oneSelectAnswer, {super.key});

  final void Function(String answer) oneSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  void answerQuestion(String answer) {
    widget.oneSelectAnswer(answer);

    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    }
  }

  @override
  Widget build(context) {
    final shuffledAnswers = List.of(questions[questionIndex].answers);
    shuffledAnswers.shuffle();
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text('Question ${questionIndex + 1}'),
          const SizedBox(height: 10),
          SizedBox(height: 10),
          Text(questions[questionIndex].text),

          for (String ans in shuffledAnswers)
            ElevatedButton(
              onPressed: () {
                answerQuestion(ans);
              },
              child: Text(ans),
            ),
        ],
      ),
    );
  }
}