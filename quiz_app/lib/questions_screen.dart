import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex currentQuestionIndex + 1;
    // currentQuestionIndex += 1;  
    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //Use as much space as possible
      child: Container(
        margin: const EdgeInsets.all(40), //Adds margins for all sides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Center the content of the screen
          crossAxisAlignment: CrossAxisAlignment.stretch, //Fills the screens width
          children: [
             Text(
              currentQuestion.text,
              style: const TextStyle(
                color:  Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, //Center the text
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer) { 
              //... pulled out and added as induviual elements to the children list
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            })
          ],
        ),
      ),
    );
  }
}