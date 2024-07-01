class QuizQuestion {
  // Attribute
  String question;
  List<String> answers;
  // [asd,  sdf,   gdf,   ghj]
  //   0     1      2      3
  int correctAnswerIndex;

  // Konstruktor
  QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });

  // Methoden
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers': answers,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      question: map["question"],
      answers: List<String>.from(map["answers"]),
      correctAnswerIndex: map["correctAnswerIndex"],
    );
  }
}
