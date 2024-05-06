import 'package:dev_hero/src/features/quiz/domain/quiz_question.dart';
import 'package:flutter/material.dart';

class QuizAnswerButtons extends StatelessWidget {
  // Attribute
  final QuizQuestion quizQuestion;

  // Konstruktor
  const QuizAnswerButtons({super.key, required this.quizQuestion});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return _generateAnswerButtons();
  }

  Column _generateAnswerButtons() {
    List<Widget> answerButtons = [];
    for (String answer in quizQuestion.answers) {
      answerButtons.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(answer),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: answerButtons,
    );
  }
}
