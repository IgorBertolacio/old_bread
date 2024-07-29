import 'package:flutter/material.dart';
//import 'package:old_bread/pages/book_page.dart';
import 'package:old_bread/pages/first_page.dart';
import 'package:old_bread/themeBread.dart';


// Função principal que inicia o aplicativo
void main() {
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
      home: FirstPage(),
    );
  }
}
