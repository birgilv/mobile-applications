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
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity, //Use as much space as possible
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center the content of the screen
        children: [
           Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30,),
          ...currentQuestion.answers.map((answer) { 
            //... pulled out and added as induviual elements to the children list
            return AnswerButton(answerText: answer, onTap: () {});
          })
        ],
      ),
    );
  }
}