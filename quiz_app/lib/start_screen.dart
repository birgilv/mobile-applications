/*
  This file defines the StartScreen widget, which serves as the initial screen of 
  the quiz application. It presents a logo, a welcome message, and a button to start 
  the quiz.
*/
import 'package:flutter/material.dart';

/*
  Constructor for the StartScreen widget.
  Parameters:
    - startQuiz: A callback function that is called when the user presses the start button.
*/
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz; // Callback function to start the quiz

  /*
    The build method constructs the UI for the StartScreen widget and centers the content 
    vertically and horizontally.
    Returns:
      - A Center widget containing a Column with an image, text, and a button.
  */
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensures the column takes up only as much vertical space as needed
        children: [
          Image.asset( // Displays the quiz logo.
            'assets/images/quiz-logo.png', 
            width: 300,
            color: const Color.fromARGB(150, 225, 255, 255)
          ),
          const SizedBox(height: 80),
          const Text('Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252), 
              fontSize: 24
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); // Calls the startQuiz function when the button is pressed
            }, 
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz')
          ),
        ],
      ),
    );
  }
}
