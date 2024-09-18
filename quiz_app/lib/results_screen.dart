/*
  This file defines the ResultsScreen widget, which displays the results of the quiz to the user. It 
  shows the number of correctly answered questions, a summary of each question with user answers, and 
  provides an option to restart the quiz.
*/
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

/*
  Constructor for the ResultsScreen widget.
  Parameters:
    - chosenAnswers: A list of the user's answers to the quiz questions.
    - onRestart: A callback function to be called when the user decides to restart the quiz.
*/
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers; // List of answers selected by the user
  final void Function() onRestart; // Callback function to restart the quiz

  /*
    The getSummaryData function generates a summary of the quiz results and creates a list 
    of maps where each map contains details about a question, including the question index, 
    text, correct answer, and the user's answer.
    Returns:
      - A list of maps with summary data for each question.
  */
  List<Map <String, Object>> getSummaryData() {
    final List<Map <String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0], // The first answer is always the correct answer
        'user_answer': chosenAnswers[i]
      });

    }

    return summary;
  }

  /*
    The build method constructs the UI for the ResultsScreen widget and displays the number of correctly 
    answered questions, a summary of all questions, and a button to restart the quiz.
    Returns:
      - A SizedBox containing a Container with the results summary and a restart button.
  */
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; // Filters the list

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly', 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 237, 223, 252), 
                fontSize: 24
              ),
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart, // Calls the restart quiz function
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}