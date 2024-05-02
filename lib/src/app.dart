import 'package:dev_hero/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OverviewScreen(),
    );
  }
}
