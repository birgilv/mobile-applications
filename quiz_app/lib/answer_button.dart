/*
  This file defines the AnswerButton widget, which represents a button used to submit an answer 
  in a quiz. The button displays the provided answer text and triggers a specified function when 
  tapped.
*/
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  /*
    Constructor for the AnswerButton widget.
    Parameters:
      - answerText: The text displayed on the button, representing an answer choice.
      - onTap: The function to be executed when the button is pressed.
  */
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap
  });

  final String answerText; // The text displayed on the answer button
  final void Function() onTap; // The function that gets executed when the button is tapped

  /*
      The build method constructs the UI for the AnswerButton widget and displays an ElevatedButton 
      with custom styles, including padding, background color, and rounded corners. The button 
      shows the answerText and triggers the onTap function when pressed.
      Returns:
        - An ElevatedButton widget styled and configured with the provided answerText and onTap callback.
    */
  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
            onPressed: onTap, // Triggers the onTap function when the button is pressed
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              backgroundColor: const Color.fromARGB(255, 33, 1, 95),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
              )
            ),
            child: Text(answerText, textAlign: TextAlign.center,), // The text displayed on the button
          );
  }
}