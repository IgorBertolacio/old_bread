import 'package:flutter/material.dart';
import 'package:old_bread/pages/book_page.dart';
import 'package:old_bread/widgets/book_page/main_menu/colors_options/color_option.dart';
import 'package:old_bread/widgets/book_page/main_menu/colors_options/old_bread_sub_options.dart';
import 'package:old_bread/widgets/book_page/main_menu/colors_options/dark_sub_options.dart';

// Widget para o sub-menu de paleta de cores
class PaletteMenu extends StatelessWidget {
  // Controle de brilho
  final double brightness;
  final ValueChanged<double> onBrightnessChanged;
  // Opções selecionadas de círculos e funções de callback
  final SelectedCircle selectedCircle;
  final Function(SelectedCircle) onSelect;
  // Callbacks de tema
  final VoidCallback setLightTheme;
  final VoidCallback setLightMediumContrastTheme;
  final VoidCallback setLightHighContrastTheme;
  final VoidCallback setDarkTheme;
  final VoidCallback setDarkMediumContrastTheme;
  final VoidCallback setDarkHighContrastTheme;

  const PaletteMenu({
    super.key,
    required this.brightness,
    required this.onBrightnessChanged,
    required this.selectedCircle,
    required this.onSelect,
    required this.setLightTheme,
    required this.setLightMediumContrastTheme,
    required this.setLightHighContrastTheme,
    required this.setDarkTheme,
    required this.setDarkMediumContrastTheme,
    required this.setDarkHighContrastTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Linha para opções de cores
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Opção de cor "Old Bread"
                ColorOption(
                  circle: SelectedCircle.oldBread,
                  color: const Color.fromARGB(255, 242, 188, 141),
                  label: 'Old Bread',
                  subOptions: OldBreadSubOptions(
                    setLightTheme: setLightTheme,
                    setLightMediumContrastTheme: setLightMediumContrastTheme,
                    setLightHighContrastTheme: setLightHighContrastTheme,
                  ),
                  selectedCircle: selectedCircle,
                  onSelect: onSelect,
                ),
                const SizedBox(width: 20),
                // Opção de cor "Dark"
                ColorOption(
                  circle: SelectedCircle.dark,
                  color: Colors.black,
                  label: 'Dark',
                  subOptions: DarkSubOptions(
                    setDarkTheme: setDarkTheme,
                    setDarkMediumContrastTheme: setDarkMediumContrastTheme,
                    setDarkHighContrastTheme: setDarkHighContrastTheme,
                  ),
                  selectedCircle: selectedCircle,
                  onSelect: onSelect,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Controle de Brilho'),
            // Slider para controle de brilho
            Slider(
              value: brightness,
              min: 0.0,
              max: 1.0,
              onChanged: onBrightnessChanged,
            ),
          ],
        ),
      ),
    );
  }
}
