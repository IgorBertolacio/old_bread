import 'package:flutter/material.dart';

// Widget para exibir a palavra no topo da página
class TopWordWidget extends StatelessWidget {
  // Tamanho da fonte da palavra
  final double fonteSizedP;
  // Palavra selecionada para exibição
  final String selectedWord;

  const TopWordWidget({
    super.key,
    required this.fonteSizedP,
    this.selectedWord = 'OldBreadBook',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        selectedWord,
        style: TextStyle(
          fontSize: fonteSizedP,
          fontFamily: 'Arial',
          // Cor da fonte comentada no código original
          // color: Colors.black,
        ),
      ),
    );
  }
}
