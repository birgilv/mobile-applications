# Assignment 1 - Meals Application

This is a meals application made in the course IDATA2305 - Mobile Application. The applcation is made my following the tutorial, section 8: Building Multi-Screen Apps & Navigating Between Screens [MEALS APP] from the Udemy course "Flutter & Dart" - The complete Guide [2024 Edition]. Here is a [link](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=SKILLS4SALEA) to the online course.

## Installation
1. Clone this repository meals_app

    HTTPS: https://github.com/birgilv/mobile-applications.git
    
    SSH: git@github.com:birgilv/mobile-applications.git

2. Select an emulator to launch
3. Navigate to the main.dart file and the main function
4. Run the application

## App architecture

### The layers
* **Data layer** 
* **Model layer** 
* **View/UI layer** 

## User stories

## Specififcation

## File and folder structure

* **lib** houses the main functionality of the app, including screens (start, quiz, result), UI components, and central quiz logic.
    * **/main.dart** is the main entry point of the application and manages initial routing and setting up the app’s navigation structure.
    * **/quiz.dart** is the core logic of the quiz, and manages quiz state, transitions between questions, and collects answers.
    * **/start_screen.dart** is the initial screen where the user starts the quiz.
Contains a button that initiates the quiz.
    * **/questions_screen.dart** is the main quiz screen that displays the current question and possible answers.
    * **/results_screen.dart** displays the user’s quiz results after the quiz is complete.
    * **/answer_button.dart** contains the widget for rendering the quiz answer buttons and handles user interaction for answer selection.
    * **/process_indicator.dart** displays a progress bar showing how many questions are left in the quiz.
* **lib/data** stores the raw data, like quiz questions, that is used across the app.
    * **/questions.dart** stores a list of quiz questions and acts as a central repository for quiz data
* **lib/models** defines the data structure of key elements (e.g., quiz questions).
    * **/quiz_questions.dart** defines the structure of a quiz question (e.g., question text, answer options, correct answer).
* **lib/questions_summary** contains all widgets and files related to displaying the quiz summary and individual question results.
    * **/questions_summary.dart** displays a summary of the quiz results, showing each question and its correct answer.
    * **/summary_item.dart** is a widget that helps display individual items in the quiz summary.
    * **/question_identifier.dart** is a helper file to identify which question is being displayed.

## Class diagram
![Class diagram](assets/images/classdiagram.png)

## Group work
I completed the task for this assignment individually without a group.

## Additional feature

### Advantages
1. The user gets **visual feedback**, which provides a clear, visual indication of how far the user have progressed, allowing them to understand how much of the quiz is left. 
2. Completing a progress indicator can give the user a small, rewarding a sense of **achievement**.
3. Without a progress indicator, users might feel lost or unsure how long the quiz will take. A progress bar **reduces this uncertainty**.
4. **UX-standards** includes that modern apps and websites use progress indicators, so users are accustomed to them. 

![Progress indicator](assets/images/progress-indicator.png)


### Other ideas
