import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_question.dart';
import 'package:dev_hero/src/features/quiz/presentation/quiz_answer_buttons.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  // Attribute
  final QuizGame quizGame;
  final QuizQuestion quizQuestion;

  // Konstruktor
  const QuizScreen(
      {super.key, required this.quizGame, required this.quizQuestion});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizGame.chapterName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Frage ${quizGame.currentQuestionIndex + 1} / ${quizGame.getNumberOfQuestions()}"),
            const SizedBox(
              height: 16,
            ),
            Text(
              quizQuestion.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: QuizAnswerButtons(quizQuestion: quizQuestion),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
