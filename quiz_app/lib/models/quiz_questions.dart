/*
  This file defines a QuizQuestion class, which represents a single quiz question. A question
  contains a text and a list of possible answers. It provides functionality to shuffle the 
  answers to randomize their order.
*/

class QuizQuestion {

  /*
    Constructor for the QuizQuestion class.
    Parameters:
      - text: The quiz question as a string.
      - answers: A list of possible answers to the quiz question.
  */
  const QuizQuestion(
    this.text,
    this.answers
  );

  final String text; // The text of the quiz question
  final List<String> answers; // A list of possible answers for the quiz question

  /*
    The getShuffledAnswers function returns a shuffled version of the answers list and it 
    creates a copy of the original answers list to avoid modifying it. It's uses the 
    shuffle() method to randomize the answer order.
    Returns:
      - List<String>: A shuffled list of answers.
  */
  List<String> getShuffledAnswers() {
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle();
    return shuffeledList;
  } 
}