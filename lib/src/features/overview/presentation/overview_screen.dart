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
    Future<List<QuizGame>> quizGamesFuture = databaseRepository.getQuizgames();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Games"),
      ),
      body: FutureBuilder(
        future: quizGamesFuture,
        builder: (context, snapshot) {
          /* 
                1. Uncompleted (Ladend)
                2. Completed with data (Fertig)
                3. Completed with error (Fehler)
                 */

          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // FALL: Future ist komplett und hat Daten!
            List<QuizGame> quizGames = snapshot.data!;
            return ListView.builder(
              itemCount: quizGames.length,
              itemBuilder: (context, index) {
                QuizGame currentQuizgame = quizGames[index];
                return ListTile(
                    title: Text(currentQuizgame.chapterName),
                    subtitle:
                        Text("${currentQuizgame.quizQuestions.length} Fragen"));
              },
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            // FALL: Sind noch im Ladezustand
            return const Center(child: CircularProgressIndicator());
          } else {
            // FALL: Es gab nen Fehler
            return const Icon(Icons.error);
          }
        },
      ),
    );
  }
}
