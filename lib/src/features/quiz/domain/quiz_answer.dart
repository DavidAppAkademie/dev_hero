import 'quiz_question.dart';

class QuizAnswer {
  // Attributes
  QuizQuestion quizQuestion;
  int selectedAnswerIndex;

  // Constructor
  QuizAnswer({required this.quizQuestion, required this.selectedAnswerIndex});

  // Methods
  bool isAnswerCorrect() {
    return quizQuestion.correctAnswerIndex == selectedAnswerIndex;
  }

  String getSelectedAnswer() {
    return quizQuestion.answers[selectedAnswerIndex];
  }

  Map<String, dynamic> toMap() {
    return {
      'quizQuestion': quizQuestion.toMap(),
      'selectedAnswerIndex': selectedAnswerIndex,
    };
  }

  factory QuizAnswer.fromMap(Map<String, dynamic> map) {
    return QuizAnswer(
      quizQuestion: QuizQuestion.fromMap(map["quizQuestion"]),
      selectedAnswerIndex: map["selectedAnswerIndex"],
    );
  }
}
