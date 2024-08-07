import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/quiz/domain/leaderboard.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/domain/score.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatefulWidget {
  final QuizGame quizGame;

  const LeaderboardScreen({super.key, required this.quizGame});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  // State
  Future<Leaderboard?>? leaderboardFuture;

  @override
  void initState() {
    super.initState();
    leaderboardFuture =
        context.read<DatabaseRepository>().getLeaderboard(widget.quizGame);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthRepository>().getCurrentUser()!;
    Score s = widget.quizGame.calculateScore(user.email!);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bestenliste"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: FutureBuilder(
                future: leaderboardFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    // Es gibt Daten! Paket fertig ausgepackt
                    final leaderboard = snapshot.data;

                    if (leaderboard == null) {
                      return const Text(
                          "Es wurde noch keine Bestenliste angelegt!");
                    } else {
                      leaderboard.scores.sort(
                        (a, b) {
                          return b.score.compareTo(a.score);
                        },
                      );
                      return ListView.builder(
                        itemCount: leaderboard.scores.length,
                        itemBuilder: (context, index) {
                          bool isFirstItem = index == 0;
                          final score = leaderboard.scores[index];
                          return Card(
                            color: isFirstItem ? Colors.amber : null,
                            child: ListTile(
                              leading: isFirstItem
                                  ? const FaIcon(FontAwesomeIcons.crown)
                                  : const Icon(Icons.person),
                              trailing: Text("#${index + 1}"),
                              title: Text("${score.score}"),
                              subtitle: Text(score.username),
                            ),
                          );
                          // return Text("Eintrag #${index + 1}");
                        },
                      );
                    }
                  } else if (snapshot.connectionState != ConnectionState.done) {
                    // wir warten noch...
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    // es gab nen Fehler
                    return const Center(child: Icon(Icons.error));
                  }
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text("Du hast ${s.score.toStringAsFixed(2)} Punkte!"),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        leaderboardFuture = null;
                      });
                      await context
                          .read<DatabaseRepository>()
                          .addScore(s, widget.quizGame);
                      setState(() {
                        leaderboardFuture = context
                            .read<DatabaseRepository>()
                            .getLeaderboard(widget.quizGame);
                      });
                    },
                    child: const Text("Score eintragen!"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
