import 'package:flutter/material.dart';

// Widget para controlar o tamanho da fonte da palavra
class FontePalavra extends StatelessWidget {
  // Tamanho da fonte da palavra
  final double fontSizeP;
  // Callback ao alterar o tamanho da fonte
  final ValueChanged<double> onFontSizeChangedP;

  const FontePalavra({
    super.key,
    required this.fontSizeP,
    required this.onFontSizeChangedP,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Fonte da Palavra'),
        // Slider para ajustar o tamanho da fonte
        Slider(
          value: fontSizeP,
          min: 26.0,
          max: 45.0,
          onChanged: onFontSizeChangedP,
        ),
      ],
    );
  }
}
