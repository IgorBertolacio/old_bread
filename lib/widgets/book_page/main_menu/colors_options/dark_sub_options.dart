import 'package:flutter/material.dart';

// Sub-opções para o tema "Dark"
class DarkSubOptions extends StatelessWidget {
  // Callbacks de tema
  final VoidCallback setDarkTheme;
  final VoidCallback setDarkMediumContrastTheme;
  final VoidCallback setDarkHighContrastTheme;

  const DarkSubOptions({
    super.key,
    required this.setDarkTheme,
    required this.setDarkMediumContrastTheme,
    required this.setDarkHighContrastTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botão para tema escuro
        GestureDetector(
          onTap: () {
            setDarkTheme();
          },
          child: const Icon(Icons.brightness_low, size: 30),
        ),
        const SizedBox(width: 10),
        // Botão para tema escuro com contraste médio
        GestureDetector(
          onTap: () {
            setDarkMediumContrastTheme();
          },
          child: const Icon(Icons.brightness_medium, size: 30),
        ),
        const SizedBox(width: 10),
        // Botão para tema escuro com alto contraste
        GestureDetector(
          onTap: () {
            setDarkHighContrastTheme();
          },
          child: const Icon(Icons.brightness_high, size: 30),
        ),
      ],
    );
  }
}
