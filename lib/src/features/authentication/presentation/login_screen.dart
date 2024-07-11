import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/features/authentication/application/validators.dart';
import 'package:dev_hero/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  // Konstruktor
  const LoginScreen({super.key});

  // Methoden
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // state:
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

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
                  controller: _emailController,
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _pwController,
                  validator: validatePw,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  onPressed: () async {
                    await context
                        .read<AuthRepository>()
                        .loginWithEmailAndPassword(
                            _emailController.text, _pwController.text);
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
                          builder: (context) => const SignUpScreen(),
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
