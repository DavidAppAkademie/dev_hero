class Score {
  double score;
  String username;

  Score({
    required this.score,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'username': username,
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      score: double.parse((map["score"]).toString()),
      username: map["username"],
    );
  }
}
