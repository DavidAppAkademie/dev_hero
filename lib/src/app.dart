import 'package:dev_hero/src/config/theme.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/authentication/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const App({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    // List<QuizGame> allQuizGames = databaseRepository.getQuizgames();
    // QuizGame sampleQuizGame = allQuizGames[1];

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: LoginScreen(
        databaseRepository: databaseRepository,
      ),
      // OverviewScreen(databaseRepository: databaseRepository),
    );
  }
}
