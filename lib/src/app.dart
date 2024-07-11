import 'package:dev_hero/src/config/theme.dart';
import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/features/authentication/presentation/login_screen.dart';
import 'package:dev_hero/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // List<QuizGame> allQuizGames = databaseRepository.getQuizgames();
    // QuizGame sampleQuizGame = allQuizGames[1];

    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('overviewScreen');

    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            key: user == null ? loginKey : overviewKey,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: user == null ? const LoginScreen() : const OverviewScreen(),
            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }
}
