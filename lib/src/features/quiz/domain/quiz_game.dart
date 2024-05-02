import 'quiz_answer.dart';
import 'quiz_question.dart';
import 'score.dart';

class QuizGame {
  // Attributes
  String id;
  String chapterNumber;
  String chapterName;
  List<QuizQuestion> quizQuestions;
  int currentQuestionIndex = 0;
  List<QuizAnswer> quizAnswers = [];

  // Constructor
  QuizGame({
    required this.id,
    required this.chapterNumber,
    required this.chapterName,
    required this.quizQuestions,
  });

  // Methods
  int getNumberOfQuestions() {
    return quizQuestions.length;
  }

  QuizQuestion? getCurrentQuizQuestion() {
    if (quizQuestions.isEmpty || currentQuestionIndex >= quizQuestions.length) {
      return null;
    } else {
      return quizQuestions[currentQuestionIndex];
    }
  }

  void _nextQuestion() {
    currentQuestionIndex++;
  }

  /// adds an answer and moves the game on to the next question
  void answerQuestion(QuizAnswer quizAnswer) {
    quizAnswers.add(quizAnswer);
    _nextQuestion();
  }

  int _getNumberOfCorrectAnswers() {
    int numberOfCorrectAnswers = 0;
    for (QuizAnswer answer in quizAnswers) {
      if (answer.isAnswerCorrect()) {
        numberOfCorrectAnswers++;
      }
    }
    return numberOfCorrectAnswers;
  }

  Score calculateScore(String username) {
    int numberOfCorrectAnswers = _getNumberOfCorrectAnswers();
    double score = numberOfCorrectAnswers / quizQuestions.length * 100;
    return Score(score: score, username: username);
  }

  void resetAnswers() {
    currentQuestionIndex = 0;
    quizAnswers = [];
  }
}
