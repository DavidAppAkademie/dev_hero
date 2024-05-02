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
}
