/*
  This file is the entry point of the quiz application. It initializes and runs the app by 
  calling the runApp() function, passing in the Quiz widget. The Quiz widget is the main 
  component that handles the quiz functionality.
*/

import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

/*
  The main function is the starting point of the application. It calls runApp() to inflate
  and display the Quiz widget, which is the root of the widget tree.
*/
void main() {
  runApp(const Quiz());
}
