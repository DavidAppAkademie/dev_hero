import '../features/quiz/domain/leaderboard.dart';
import '../features/quiz/domain/quiz_game.dart';
import '../features/quiz/domain/quiz_question.dart';
import '../features/quiz/domain/score.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Simulierte Datenbank
  List<QuizGame> quizGames = _createMockQuizGames();
  List<Leaderboard> leaderboards = _createMockLeaderboards();

  // Methoden der Schablone `DatabaseRepository`

  @override
  Future<List<QuizGame>> getQuizgames() async {
    // Simuliere Wartezeit von 3 Sekunden (langsame Verbindung)
    await Future.delayed(const Duration(seconds: 2));

    return quizGames;
  }

  @override
  Future<Leaderboard?> getLeaderboard(QuizGame game) async {
    // Simuliere Wartezeit von 3 Sekunden (langsame Verbindung)
    await Future.delayed(const Duration(seconds: 2));

    // durchsuche alle Leaderboards nach dem gesuchten QuizGame
    for (Leaderboard l in leaderboards) {
      if (l.quizGameId == game.id) {
        // wenn das gesuchte QuizGame gefunden wurde, gib das Leaderboard zurück
        return l;
      }
    }
    // wenn das gesuchte QuizGame nicht gefunden wurde, gib null zurück
    return null;
  }

  @override
  Future<void> addScore(Score score, QuizGame quizGame) async {
    // Simuliere Wartezeit von 3 Sekunden (langsame Verbindung)
    await Future.delayed(const Duration(seconds: 2));

    Leaderboard? leaderboard = await getLeaderboard(quizGame);
    if (leaderboard == null) {
      // Leaderboard existiert noch nicht
      // -> erstelle neues Leaderboard mit dem Score als erstem Eintrag
      leaderboard = Leaderboard(quizGameId: quizGame.id, scores: [score]);
      // füge das neue Leaderboard zur Liste der Leaderboards hinzu
      leaderboards.add(leaderboard);
    } else {
      // Leaderboard existiert bereits
      // -> füge den Score zum gefundenen Leaderboard hinzu
      leaderboard.scores.add(score);
    }
  }
}

// Helper Functions - erstellen uns Beispieldaten
List<QuizGame> _createMockQuizGames() {
// Erstelle einige Quizfragen
  QuizQuestion q1 = QuizQuestion(
    question: "Was ergibt 1 + 1",
    answers: ["3", "200", "2", "0"],
    correctAnswerIndex: 2,
  );

  QuizQuestion q2 = QuizQuestion(
    question: "Was ergibt 2 * 2",
    answers: ["4", "200", "2", "0"],
    correctAnswerIndex: 0,
  );

  // Erstelle ein Quizgame mit den erstellten Quizfragen
  QuizGame quizGame1 = QuizGame(
    id: "1",
    chapterNumber: "3",
    chapterName: "Grundlagen der Programmierung",
    quizQuestions: [
      q1,
      q2,
    ],
  );

  QuizQuestion q3 = QuizQuestion(
    question: "Welches Widget wird verwendet, um Text anzuzeigen?",
    answers: ["Text", "Container", "Column", "Row"],
    correctAnswerIndex: 0,
  );

  QuizQuestion q4 = QuizQuestion(
    question: "Welches Widget wird verwendet, um Widgets vertikal anzuordnen?",
    answers: ["Text", "Container", "Column", "Row"],
    correctAnswerIndex: 2,
  );

  QuizQuestion q5 = QuizQuestion(
    question:
        "Welches Widget wird verwendet, um Widgets horizontal anzuordnen?",
    answers: ["Text", "Container", "Column", "Row"],
    correctAnswerIndex: 3,
  );

  QuizGame quizGame2 = QuizGame(
    id: "2",
    chapterNumber: "4",
    chapterName: "Flutter I",
    quizQuestions: [
      q3,
      q4,
      q5,
    ],
  );

  // Füge QuizGames zur Liste hinzu
  return [quizGame1, quizGame2];
}

List<Leaderboard> _createMockLeaderboards() {
  // Erstelle einige Scores
  Score score1 = Score(username: "David", score: 99.2);
  Score score2 = Score(username: "Max", score: 44);
  Score score3 = Score(username: "Anna", score: 55.5);

  // Erstelle ein Leaderboard mit den erstellten Scores
  Leaderboard leaderboard1 = Leaderboard(
    quizGameId: "1",
    scores: [score1, score2, score3],
  );

  // Füge Leaderboard zur Liste hinzu
  return [leaderboard1];
}
