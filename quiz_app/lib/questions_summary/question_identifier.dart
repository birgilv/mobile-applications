/*
  This file defines the QuestionIdentifier widget, which displays a visual representation
  of the current quiz question index, with an indication of whether the answer is correct or incorrect.
*/
import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {

  /*
    Constructor for the QuestionIdentifier widget.
    Parameters:
      - isCorrectAnswer: A boolean that indicates whether the answer is correct.
      - questionIndex: The index of the current question in the quiz.
  */
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex; // Index of the current quiz question
  final bool isCorrectAnswer; // Indicates if the answer to the question is correct

  /*
      The build method builds the UI for the QuestionIdentifier widget. It displays a circular container 
      with the question number inside it and the container's background color changes based on whether 
      the answer is correct or not.
      Returns:
        - A Container widget styled with a background color and text displaying the question number.
    */
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1; // Question number starts from 1, because humans stats counting at 1
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center, // Centers the content inside the container
      decoration: BoxDecoration(
        color: isCorrectAnswer // Sets the background color based on whether the answer is correct.
            ? const Color.fromARGB(255, 241, 150, 214) 
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100), 
      ),
      child: Text(
        questionNumber.toString(), // Displays the question number inside the container
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}