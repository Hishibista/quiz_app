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
  void answerQuestion(String answer){
    setState(() {
      widget.oneSelectAnswer(answer);
      questionIndex++; 
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height:10),
          Text('Question ${questionIndex + 1}'),
          SizedBox(height:10),
          Text(questions[questionIndex].text),
          
          for (String ans in questions[questionIndex].answers)
            ElevatedButton(onPressed:(){answerQuestion(ans);}, child: Text(ans))
      ],
    ),
    );
  }
}