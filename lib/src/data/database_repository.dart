import '../features/quiz/domain/leaderboard.dart';
import '../features/quiz/domain/quiz_game.dart';
import '../features/quiz/domain/score.dart';

abstract class DatabaseRepository {
  /// gibt alle Quizgames aus der Datenbank zurück
  Future<List<QuizGame>> getQuizgames();

  /// gibt das `Leaderboard` zum gegebenen `quizGame` zurück
  ///
  /// gibt `null` zurück, wenn zum `quizGame` kein Leaderboard gefunden wurde
  Future<Leaderboard?> getLeaderboard(QuizGame quizGame);

  /// fügt den gegebenen `score` zum gegebenen `quizGame` hinzu
  Future<void> addScore(Score score, QuizGame quizGame);
}
