import 'package:flutter/material.dart';

// Widget para controlar o tamanho da fonte do livro
class FonteLivro extends StatelessWidget {
  // Tamanho da fonte do livro
  final double fontSize;
  // Callback ao alterar o tamanho da fonte
  final ValueChanged<double> onFontSizeChanged;

  const FonteLivro({
    super.key,
    required this.fontSize,
    required this.onFontSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Fonte do Livro'),
        // Slider para ajustar o tamanho da fonte
        Slider(
          value: fontSize,
          min: 8.0,
          max: 25.0,
          onChanged: onFontSizeChanged,
        ),
      ],
    );
  }
}
