import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bestenliste"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            bool isFirstItem = index == 0;
            return Card(
              color: isFirstItem ? Colors.amber : null,
              child: ListTile(
                leading: isFirstItem
                    ? const FaIcon(FontAwesomeIcons.crown)
                    : const Icon(Icons.person),
                trailing: Text("#${index + 1}"),
                title: const Text("100"),
                subtitle: Text("Users$index"),
              ),
            );
            // return Text("Eintrag #${index + 1}");
          },
        ),
      ),
    );
  }
}
