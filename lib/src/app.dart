import 'package:dev_hero/src/config/theme.dart';
import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/authentication/presentation/login_screen.dart';
import 'package:dev_hero/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const App(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    // List<QuizGame> allQuizGames = databaseRepository.getQuizgames();
    // QuizGame sampleQuizGame = allQuizGames[1];

    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('overviewScreen');

    return StreamBuilder(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : overviewKey,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: user == null
                ? LoginScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
                  )
                : OverviewScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository),
            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }
}
