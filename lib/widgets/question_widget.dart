import 'package:firebase_app/constants.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final int indexAction;
  final int totalQuestions;
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Question ${indexAction + 1}/$totalQuestions:$question',
          style: const TextStyle(fontSize: 24.0, color: neutral),
        ));
  }
}
