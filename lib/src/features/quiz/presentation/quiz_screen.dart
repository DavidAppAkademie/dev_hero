import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/presentation/quiz_answer_buttons.dart';
import 'package:dev_hero/src/features/quiz/presentation/user_score.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  // Attribute
  final QuizGame quizGame;
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  // Konstruktor
  const QuizScreen(
      {super.key,
      required this.quizGame,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Methoden
  @override
  Widget build(BuildContext context) {
    final quizQuestion = widget.quizGame.getCurrentQuizQuestion();
    bool isGameOver = quizQuestion == null;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizGame.chapterName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isGameOver
            ? UserScore(
                quizGame: widget.quizGame,
                databaseRepository: widget.databaseRepository,
                authRepository: widget.authRepository,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Frage ${widget.quizGame.currentQuestionIndex + 1} / ${widget.quizGame.getNumberOfQuestions()}"),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    quizQuestion.question,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: QuizAnswerButtons(quizGame: widget.quizGame),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      // lade den Screen neu!
                      setState(() {});
                    },
                    child: const Text("Weiter"),
                  ),
                ],
              ),
      ),
    );
  }
}
