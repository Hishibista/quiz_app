class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // correct answer is always in the first slot answers[0]
  String getCorrectAnswer() => answers[0];
  String get correctAnswer => answers[0]; //instead of return 
  

}
