/*
  This file defines the QuestionsSummary widget, which is responsible for displaying a list of 
  summary items. Each summary item represents a question and its details (e.g., the user's answer 
  and whether it was correct). The summary is displayed in a scrollable container.
*/


import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  /*
    Constructor for the QuestionsSummary widget.
    Parameters:
      - summaryData: A list of maps containing question data such as the user's answers and whether
        they were correct.
  */
  const QuestionsSummary(
    this.summaryData, 
    {super.key}
  );

  final List<Map<String, Object>> summaryData; // A list of data for each question's summary

  /*
      The build method constructs the UI for the QuestionsSummary widget and displays a scrollable 
      list of summary items, each corresponding to a question's summary.
      Returns:
        - A SizedBox containing a SingleChildScrollView widget, which allows scrolling through the
        summary items.
    */
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView( // Allows the summary content to be scrollable when it overflows vertically.
        child: Column(
          children: summaryData.map( // Maps the summaryData list to a list of SummaryItem widgets
            (data) {
              return SummaryItem(data);
            },
          ).toList(), // Converts the mapped summary items into a list of widgets
        ),
      ),
    );
  }
}