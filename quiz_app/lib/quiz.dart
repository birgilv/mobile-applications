/*
  This file defines the Quiz widget, which manages the state and navigation of the quiz application. It 
  handles switching between different screens (start screen, questions screen, and results screen), keeps 
  track of the selected answers, and provides functionality to restart the quiz.
*/
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  /*
    Constructor for the Quiz widget.
    This widget serves as the main entry point for managing the quiz state and navigation.
  */
  const Quiz({super.key});

  /*
    Creates the state for the Quiz widget
  */
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

/*
  The _QuizState class is private to the file and manages the quiz logic and state, by using 
  the _ (underscore), the class is defined private.
*/
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // List to keep track of selected answers
  var activeScreen = 'start-screen'; // Current active screen

  /*
    The switchScreen function changes the active screen to 'questions-screen' when called 
    and updates the state to reflect the screen change.
  */
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  /*
    The chooseAnswer function adds the selected answer to the list of selected answers and 
    checks if all questions have been answered. If so, switches to the results screen. It 
    udates the state to reflect the screen change.
    Parameters:
      - answer: The answer selected by the user.
  */
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  /*
    The restartQuiz function resets the quiz state, clearing the selected answers and returning 
    to the start screen. As well as updates the state to reflect the changes.
  */
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  /*
      The build method determines which screen widget to display based on the activeScreen state 
      and wraps the active screen widget in a MaterialApp and Scaffold with a gradient background.
      Returns:
        - A MaterialApp containing a Scaffold with the active screen widget.
    */
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen); // Default to the start screen

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(  
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(225, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}