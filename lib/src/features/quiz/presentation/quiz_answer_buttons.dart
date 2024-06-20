import 'package:dev_hero/src/features/quiz/domain/quiz_answer.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:flutter/material.dart';

class QuizAnswerButtons extends StatelessWidget {
  // Attribute
  final QuizGame quizGame;

  // Konstruktor
  const QuizAnswerButtons({super.key, required this.quizGame});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return _generateAnswerButtons();
  }

  Column _generateAnswerButtons() {
    final currentQuestion = quizGame.getCurrentQuizQuestion();

    List<Widget> answerButtons = [];
    for (int i = 0; i < currentQuestion!.answers.length; i++) {
      answerButtons.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                // Sage dem QuizGame, dass eine Frage beantwortet wurde
                quizGame.answerQuestion(
                  QuizAnswer(
                    quizQuestion: currentQuestion,
                    selectedAnswerIndex: i,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(currentQuestion.answers[i]),
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
