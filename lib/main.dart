import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_hero/firebase_options.dart';
import 'package:dev_hero/src/app.dart';
import 'package:dev_hero/src/data/auth_repository.dart';
import 'package:dev_hero/src/data/database_repository.dart';
import 'package:dev_hero/src/data/firestore_database.dart';
import 'package:dev_hero/src/features/settings/presentation/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Database einmal an der Wurzel erzeugt
  // DatabaseRepository databaseRepository = MockDatabase();
  DatabaseRepository databaseRepository =
      FirestoreDatabase(FirebaseFirestore.instance);

  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        Provider<AuthRepository>(
          create: (_) => authRepository,
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const App(),
    ),
  );
}
