class QuizQuestion {
  const QuizQuestion(
    this.text,
    this.answers
  );

  final String text; 
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle(); //Shuffles the copy of the original answers list
    return shuffeledList;
  } 
}