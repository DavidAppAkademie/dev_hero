import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const OverviewScreen({super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    List<QuizGame> quizGames = databaseRepository.getQuizgames();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Übersicht"),
        ),
        body: ListView.builder(
          itemCount: quizGames.length,
          itemBuilder: (context, index) {
            QuizGame currentQuizgame = quizGames[index];
            return ListTile(
                title: Text(currentQuizgame.chapterName),
                subtitle:
                    Text("${currentQuizgame.quizQuestions.length} Fragen"));
          },
        ));
  }
}
