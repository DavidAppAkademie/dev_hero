import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/presentation/quiz_screen.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  // Konstruktor
  const OverviewScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late Future<List<QuizGame>> quizGamesFuture;

  @override
  void initState() {
    super.initState();
    quizGamesFuture = widget.databaseRepository.getQuizgames();
  }

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Games"),
        actions: [
          IconButton(
            onPressed: () async {
              await widget.authRepository.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
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
                    onTap: () {
                      // Navigiere zu Quizscreen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizGame: currentQuizgame,
                            ),
                          ));
                    },
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
