import 'package:firebase_app/constants.dart';
import 'package:firebase_app/widgets/next_button.dart';
import 'package:firebase_app/widgets/question_widget.dart';
import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false;

  void nextQuestion() {
    if (isPressed == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Please select any option"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.0),
      ));
    }
    if (index == _questions.length - 1) {
      return;
    }
    setState(() {
      index++;
      isPressed = false;
    });
  }

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  final List<Question> _questions = [
    Question(
        id: '10',
        title: 'What is 2+2 ?',
        options: {'5': false, '30': false, '4': true, '10': false}),
    Question(
        id: '11',
        title: 'What is 10 + 20 ?',
        options: {'15': false, '30': true, '4': false, '10': false}),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestions: _questions.length,
            ),
            const Divider(
              color: neutral,
            ),
            const SizedBox(height: 25),
            for (int i = 0; i < _questions[index].options.length; i++)
              OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed
                    ? _questions[index].options.values.toList()[i]
                        ? correct
                        : incorrect
                    : neutral,
                onTap: changeColor,
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: NextButton(
            nextQuestion: nextQuestion,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
