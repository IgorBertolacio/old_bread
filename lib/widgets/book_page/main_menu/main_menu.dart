import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:old_bread/widgets/book_page/main_menu/main_menu_header.dart';
import 'package:old_bread/widgets/book_page/main_menu/colors_options/palette_menu.dart';
import 'package:old_bread/widgets/book_page/main_menu/font_options/fonte_controller.dart';
import 'package:old_bread/pages/book_page.dart'; 

// Widget para o menu principal
class MainMenu extends StatelessWidget {
  // Controle da visibilidade e expansão do menu
  final bool isMenuVisible;
  final bool isMenuExpanded;
  // Funções de callback para ações no menu
  final Function onMenuTap;
  final Function onSubMenuTap;
  // Opções selecionadas no menu e círculo
  final MenuOption selectedOption;
  final Function(MenuOption) onOptionSelect;
  // Controle de brilho e tamanho das fontes
  final double brightness;
  final ValueChanged<double> onBrightnessChanged;
  final SelectedCircle selectedCircle;
  final Function(SelectedCircle) onSelect;
  final double fontSize;
  final ValueChanged<double> onFontSizeChanged;
  final double fontSizeP;
  final ValueChanged<double> onFontSizeChangedP;
  // Callbacks de tema
  final VoidCallback setLightTheme;
  final VoidCallback setLightMediumContrastTheme;
  final VoidCallback setLightHighContrastTheme;
  final VoidCallback setDarkTheme;
  final VoidCallback setDarkMediumContrastTheme;
  final VoidCallback setDarkHighContrastTheme;

  //bloquio
  final bool isLocked;

  const MainMenu({
    super.key,
    required this.isMenuVisible,
    required this.isMenuExpanded,
    required this.onMenuTap,
    required this.onSubMenuTap,
    required this.selectedOption,
    required this.onOptionSelect,
    required this.brightness,
    required this.onBrightnessChanged,
    required this.selectedCircle,
    required this.onSelect,
    required this.fontSize,
    required this.onFontSizeChanged,
    required this.fontSizeP,
    required this.onFontSizeChangedP,
    required this.setLightTheme,
    required this.setLightMediumContrastTheme,
    required this.setLightHighContrastTheme,
    required this.setDarkTheme,
    required this.setDarkMediumContrastTheme,
    required this.setDarkHighContrastTheme, 
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: isMenuVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () {
            if (!isMenuExpanded) {
              onOptionSelect(MenuOption.palette);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isMenuExpanded ? 300 : 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Cabeçalho do menu principal
                      MainMenuHeader(
                        isMenuExpanded: isMenuExpanded,
                        onOptionSelect: onOptionSelect,
                        onMenuTap: onMenuTap,
                        onSubMenuTap: onSubMenuTap,
                        isLocked: isLocked,                        
                      ),
                      if (selectedOption == MenuOption.palette)
                        // Sub-menu de paleta de cores
                        PaletteMenu(
                          brightness: brightness,
                          onBrightnessChanged: onBrightnessChanged,
                          selectedCircle: selectedCircle,
                          onSelect: onSelect,
                          setLightTheme: setLightTheme,
                          setLightMediumContrastTheme:
                              setLightMediumContrastTheme,
                          setLightHighContrastTheme: setLightHighContrastTheme,
                          setDarkTheme: setDarkTheme,
                          setDarkMediumContrastTheme:
                              setDarkMediumContrastTheme,
                          setDarkHighContrastTheme: setDarkHighContrastTheme,
                        ),
                      if (selectedOption == MenuOption.text)
                        // Sub-menu de opções de fonte
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Widget para controlar o tamanho da fonte
                                FonteControlador(
                                  fontSizeLivro: fontSize,
                                  fontSizePalavra: fontSizeP,
                                  onFontSizeChangedLivro: onFontSizeChanged,
                                  onFontSizeChangedPalavra: onFontSizeChangedP,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
