/*
  This file defines the QuestionsScreen widget, which displays the current quiz question and its 
  possible answers. It handles user interactions by updating the question index and notifying the 
  parent widget when an answer is selected.
*/
import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';


/*
    Constructor for the QuestionsScreen widget.
    Parameters:
      - onSelectAnswer: A callback function that is called when an answer is selected, passing the
        selected answer as a parameter.
*/
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer; // Callback function for handling selected answers

/*
  Creates the state for the QuestionsScreen widget
*/
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

/*
  This function handles the logic when an answer is selected with the function answerQuestion which calls 
  the onSelectAnswer callback with the selected answer. Then increments the currentQuestionIndex to move to the 
  next question and calls setState to update the UI with the new question index.
  */
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex ++;
      /*
      Here are some alternative formas:
      - currentQuestionIndex currentQuestionIndex + 1;
      - currentQuestionIndex += 1;  
      */
    });
  }

 /*
      The build method constructs the UI for the QuestionsScreen widget and displays the current question and 
      its shuffled answer options.
      Returns:
        - A SizedBox containing a Container with the question and answer buttons.
  */
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; // Gets the current question

    return SizedBox(
      width: double.infinity, // Expands to use as much horizontal space as possible
      child: Container(
        margin: const EdgeInsets.all(40), // Adds margins around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches content to fill the width
          children: [
             Text(
              currentQuestion.text,
              style: const TextStyle(
                color:  Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer) { // .. pulled out and added as induviual elements to the children list
              return AnswerButton(
                answerText: answer, 
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}