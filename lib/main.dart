import 'package:flutter/material.dart';
import 'package:quiz_app/screen_controller.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: const Color.fromARGB(255, 247, 145, 179),
        ), 
        body: ScreenController(nextScreen: Screen.start)
      )
  ),);
}

