import 'package:daat_flow/pages/book_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:old_bread/pages/book_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'firebase_options.dart';
import 'pages/moon_ligth.dart';
import 'comun/themeBread.dart';

// Geracao de logs
final logger = Logger('LoginScreen');
void ConfigureLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

// Função principal que inicia o aplicativo
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ConfigureLogging();
  runApp(OldBreadApp(theme: const MaterialTheme(TextTheme()).light()));
}

class OldBreadApp extends StatelessWidget {
  final ThemeData theme;

  const OldBreadApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OldBread',
      //theme: theme,
      home: RoutScreen(),
    );
  }
}

class RoutScreen extends StatelessWidget {
  const RoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const OldBreadBook();
        } else {
          return const FirstPage();
        }
      },
    );
  }
}
