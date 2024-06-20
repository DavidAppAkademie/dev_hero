import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:flutter/material.dart';

class UserScore extends StatelessWidget {
  final QuizGame quizGame;

  const UserScore({super.key, required this.quizGame});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Quiz beendet!",
              style: Theme.of(context).textTheme.headlineSmall),
          Text(
            "Dein Punktestand ist: ${quizGame.calculateScore("Dummy User").score.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ElevatedButton(
            onPressed: () {
              quizGame.resetAnswers();
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Zurück zur Übersicht"),
            ),
          )
        ],
      ),
    );
  }
}
