# Assignment 1 - Quiz Application

This is an quiz application made in the course IDATA2305 - Mobile Application. The applcation is made my following the tutorial, section 3: Flutter & Dart Basics II - Fundementals deep dive [QUIZ APP], from the Udemy course "Flutter & Dart" - The complete Guide [2024 Edition]. Here is a [link](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=SKILLS4SALEA) to the online course.

## App architecture
The Quiz App follows a simple, structured architecture that separates files into different layers. The architecture is designed for maintainability and scalability, focusing on breaking down the app's functionality into smaller, reusable components. This approach leverages the strengths of Dart and Flutter in creating clean, responsive, and fast UI applications.

### The layers
* **Data layer** which holds the data that powers the application. This includes the file questions.dart which contains the questions to displayed.
* **Model layer** which defines the datastructure. The file quiz_questions.dart defines the stucture of the question. 
* **View/UI layer** which manages the userinterface and interactions. The layer handles the screen swithing and other components such as the answer button and process bar.

## User stories
The user stats the application with a start screen. The start screen is simple, and contains a picture and a start button. By pressing the start button the quiz is started and the screen swithces from the start- to the questionscreen.

The questionsscreen shows a single question with a text and possible 4 answers. The answers is displayed with clickable buttons under the questiontext. At the botton of the questionscreen, a progress indicator shows the users progress of the quiz. The indicator is in the format **current question / the total amount of questions**. The answer list is shuffled, so the answers is displayed in ransomized order. The user can only select one answer for each question, and chooses their answer by clicking on the answer. 

When the user has completed the quiz, the screen switches from the question- to the resultsscreen. The resultsscreen displays **the number of questions answerd corrctly / the total amount of questions**. Below, all the questions is displayed with the question text, the user chosen answer and correct question, as well as a color indicator for corrctly answered or not. This is a scrollable list and at the bottom of the screen is a restart button.

If the user press the restart button, the quiz is reset. The user is redirected to the start screen, where the screen switches from the results- to the startscreen. The user is now able to restart the quiz, and all the previous answers is cleard. 

## Specififcation

## File and folder structure

## Class diagram

## Group work
I completed the task for this assignment alone without a group. Therefore, there is not much to say about the teamwork for this project.

## Additional feature
For the additional feature a progress indicator was added. The progress indicator display the current question of the total amount of questions in the questionset. Typically used on webpages, such as newspaper or photo galleries. By adding a progress indicator the user knows their progress throughout the quiz. The see both their current question number and the total amout of question to answer. 

### Advantages
1. The user gets **visual feedback**, which provides a clear, visual indication of how far the user have progressed, allowing them to understand how much of the quiz is left. 
2. Completing a progress indicator can give the user a small, rewarding a sense of **achievement**.
3. Without a progress indicator, users might feel lost or unsure how long the quiz will take. A progress bar **reduces this uncertainty**.
4. **UX-standards** includes that modern apps and websites use progress indicators, so users are accustomed to them. 

![Progress indicator](assets/images/progress-indicator.png)


### Other ideas
* A restart or exit button to be displayed throughout the quiz. The selected answers should be saved and if the user selects restart, the data is cleared and a new quiz is started. If the user selects exit, the answers should be saved as a *saved quiz* which can be continued with the *continue quiz* option on the startscreen.
* If the user have to interrupt the quiz, and want to finish it later, the quiz should be able to store the users answers. On the startscreen have an option *continue quiz*
* Save the completed quizzes in the application. On the startscreen have an option *review completed quizzes* where the user can review all of their previous quizzes. 