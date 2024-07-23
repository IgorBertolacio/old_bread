import 'package:flutter/material.dart';

// Widget para controlar o tamanho da fonte
class FonteControlador extends StatelessWidget {
  // Tamanho da fonte do livro e da palavra
  final double fontSizeLivro;
  final double fontSizePalavra;

  // Callbacks ao alterar o tamanho da fonte
  final ValueChanged<double> onFontSizeChangedLivro;
  final ValueChanged<double> onFontSizeChangedPalavra;

  const FonteControlador({
    super.key,
    required this.fontSizeLivro,
    required this.fontSizePalavra,
    required this.onFontSizeChangedLivro,
    required this.onFontSizeChangedPalavra,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
          child: Column(children: [
        // Widget para ajustar o tamanho da fonte do livro
        const Text('Fonte do Livro'),
        Slider(
          value: fontSizeLivro,
          min: 8.0,
          max: 25.0,
          onChanged: onFontSizeChangedLivro,
        ),
        // Widget para ajustar o tamanho da fonte da palavra
        const Text('Fonte da Palavra'),
        Slider(
          value: fontSizePalavra,
          min: 26.0,
          max: 45.0,
          onChanged: onFontSizeChangedPalavra,
        ),
      ])),
    );
  }
}
