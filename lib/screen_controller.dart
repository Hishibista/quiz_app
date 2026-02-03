//import 'package:flutter/cupertino.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

//Screen is a type, it is a name for a set of values 
enum Screen{start, question, results}

class ScreenController extends StatefulWidget{
  const ScreenController({super.key, required this.nextScreen}); 
    final Screen nextScreen;

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  late Screen currScreen;

  @override
  void initState(){
    super.initState();
    currScreen = widget.nextScreen;
  }

  List <String> selectedAnswer = []; 

  void switchScreen() {
    setState((){
    if (currScreen == Screen.start){
      currScreen = Screen.question;
    }
  });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length){
      setState(() {
        currScreen = Screen.results;
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer.clear();
      currScreen = Screen.start;
    });
  }

  @override
  Widget build(BuildContext context){
     if (currScreen == Screen.start){
      //currScreen = Screen.question; //prepare for the next screen 
      return StartScreen(switchScreen);
    }
    else if (currScreen == Screen.question){
      return QuestionScreen(chooseAnswer);
    }
    else if (currScreen == Screen.results){
      final int totalQuestions = questions.length;
      int score = 0; 
      for (int i = 0; i < selectedAnswer.length; i++){
        if (selectedAnswer[i] == questions[i].correctAnswer){
          score++; 
        }
      }
      return ResultScreen(
        score: score,
        totalQuestions: totalQuestions,
        oneRestart: restartQuiz,
        chooseAnswer: selectedAnswer,
      );
    }
  
    return const SizedBox.shrink();
  
    //return const Placeholder();
  }
}