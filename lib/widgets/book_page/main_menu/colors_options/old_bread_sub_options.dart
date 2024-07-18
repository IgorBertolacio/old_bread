import 'package:flutter/material.dart';

// Sub-opções para o tema "Old Bread"
class OldBreadSubOptions extends StatelessWidget {
  // Callbacks de tema
  final VoidCallback setLightTheme;
  final VoidCallback setLightMediumContrastTheme;
  final VoidCallback setLightHighContrastTheme;

  const OldBreadSubOptions({
    super.key,
    required this.setLightTheme,
    required this.setLightMediumContrastTheme,
    required this.setLightHighContrastTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botão para tema claro
        GestureDetector(
          onTap: () {
            setLightTheme();
          },
          child: const Icon(Icons.brightness_low, size: 30),
        ),
        const SizedBox(width: 10),
        // Botão para tema claro com contraste médio
        GestureDetector(
          onTap: () {
            setLightMediumContrastTheme();
          },
          child: const Icon(Icons.brightness_medium, size: 30),
        ),
        const SizedBox(width: 10),
        // Botão para tema claro com alto contraste
        GestureDetector(
          onTap: () {
            setLightHighContrastTheme();
          },
          child: const Icon(Icons.brightness_high, size: 30),
        ),
      ],
    );
  }
}
