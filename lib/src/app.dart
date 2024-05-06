import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/data/mock_database.dart';
import 'package:dev_hero/src/features/quiz/domain/quiz_game.dart';
import 'package:dev_hero/src/features/quiz/presentation/quiz_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Database einmal an der Wurzel erzeugt
    DatabaseRepository databaseRepository = MockDatabase();

    List<QuizGame> allQuizGames = databaseRepository.getQuizgames();
    QuizGame sampleQuizGame = allQuizGames[1];

    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      themeMode: ThemeMode.light,
      home: QuizScreen(
        quizGame: sampleQuizGame,
        quizQuestion: sampleQuizGame.quizQuestions[0],
      ),
      // LoginScreen(
      //   databaseRepository: databaseRepository,
      // ),
      // OverviewScreen(databaseRepository: databaseRepository),
    );
  }
}
