import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:dev_hero/src/features/overview/presentation/overview_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const LoginScreen({super.key, required this.databaseRepository});

  // Methoden
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // state:
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                const Center(
                    child: Image(
                        width: 300,
                        image: AssetImage('assets/images/logo_light.png'))),
                const SizedBox(height: 32),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Passwort",
                    icon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // TODO: login logik einbauen

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OverviewScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Login"),
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(
                            databaseRepository: widget.databaseRepository,
                          ),
                        ));
                  },
                  child: const Text("Noch keinen Account? Zur Registrierung"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
