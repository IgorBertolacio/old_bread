import 'package:flutter/material.dart';
import 'package:old_bread/pages/book_page.dart';
import 'package:old_bread/themeBread.dart';

// Função principal que inicia o aplicativo
void main() {
  runApp(OldBreadApp(theme: const MaterialTheme(TextTheme()).light()));
}

// Classe principal do aplicativo que estende StatelessWidget
class OldBreadApp extends StatelessWidget {
  // Tema do aplicativo
  final ThemeData theme;

  // Construtor da classe OldBreadApp
  const OldBreadApp({super.key, required this.theme});

  // Método build para construir a interface do usuário
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'OldBread', // Título do aplicativo
      theme: theme, // Define o tema do aplicativo
      home: const OldBreadBook(), // Define a página inicial
    );
  }
}
