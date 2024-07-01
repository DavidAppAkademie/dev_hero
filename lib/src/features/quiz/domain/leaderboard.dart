import 'score.dart';

class Leaderboard {
  // Attributes
  String quizGameId;
  List<Score> scores;

  // Constructor
  Leaderboard({required this.quizGameId, required this.scores});

  Map<String, dynamic> toMap() {
    return {
      'quizGameId': quizGameId,
      'scores': scores.map((score) => score.toMap()).toList(),
    };
  }

  factory Leaderboard.fromMap(Map<String, dynamic> map) {
    return Leaderboard(
      quizGameId: map["quizGameId"],
      scores: List<Score>.from(map["scores"].map((x) => Score.fromMap(x))),
    );
  }
}
