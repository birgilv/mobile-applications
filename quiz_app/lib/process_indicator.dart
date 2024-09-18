/*
  This file defines the ProgressIndicatorWidget widget, which displays the current 
  progress of the quiz in terms of the number of questions answered out of the total questions.
*/

import 'package:flutter/material.dart';

/*
  The ProgressIndicatorWidget widget displays the current question number and the total number of questions.
  It is used to provide users with visual feedback on their progress through the quiz.

  Parameters:
    - questionNumber: The index of the current question, indicating the user's progress.
    - numTotalQuestions: The total number of questions in the quiz.
*/
class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.questionNumber, 
    required this.numTotalQuestions,
  });

  final int questionNumber; // Current question number
  final int numTotalQuestions; // Total number of questions

  /*
    Builds the UI for the ProgressIndicatorWidget.
    Returns:
      - A Column widget containing the progress text displaying the current question number and total questions.
  */
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          'Question: $questionNumber / $numTotalQuestions', // Displays current progress
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}