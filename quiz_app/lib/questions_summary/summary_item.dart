/*
  This file defines the SummaryItem widget, which is used to display the summary details of a 
  single quiz question. It includes the question, the user's answer, the correct answer, and 
  an indicator of whether the user's answer was correct or not.
*/

import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  /*
    Constructor for the SummaryItem widget.
    Parameters:
      - itemData: A map containing the details of the quiz question such as the question text, 
        user's answer, and correct answer.
  */
  const SummaryItem(
    this.itemData, 
    {super.key}
  );

  final Map<String, Object> itemData; // Data related to a specific quiz question

  /*
      The build method builds the UI for the SummaryItem widget and displays the question, the 
      user's answer, the correct answer, and an icon indicating whether the user's answer was correct.
      Returns:
        - A Padding widget containing a Row with the question and answer details.
    */
  @override
  Widget build(BuildContext context) {

    /*
      Checks if the user's answer is correct
    */
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8, // Adds vertical padding between summary items
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier( // Displays the question number and highlights whether the answer was correct or incorrect.
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded( // Ensures that the text content takes up the remaining horizontal space.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    )),
                Text(itemData['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}