import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:old_bread/themeBread.dart';
import 'package:old_bread/widgets/book_page/word_control/main_word_control.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:old_bread/widgets/book_page/top_word_widget.dart';
import 'package:old_bread/widgets/book_page/ppm_text_widget.dart';
import 'package:old_bread/widgets/book_page/main_text_widget.dart';
import 'package:old_bread/widgets/book_page/main_menu/main_menu.dart';

// Enum para as opções do menu
enum MenuOption { none, palette, text, settings, lock }

// Enum para os círculos selecionados
enum SelectedCircle { none, oldBread, dark, white }

// Classe principal do aplicativo
class OldBreadBook extends StatefulWidget {
  const OldBreadBook({super.key});

  @override
  OldBreadBookState createState() => OldBreadBookState();
}

// Estado do aplicativo
class OldBreadBookState extends State<OldBreadBook> {
  bool isMenuVisible = false; // Controle da visibilidade
  bool isMenuExpanded = false; //Controle de expansão do menu
  String _defaultText = 'Carregando...'; // Texto padrão carregado
  MenuOption selectedOption = MenuOption.none; // Opção selecionada
  SelectedCircle selectedCircle =
      SelectedCircle.none; // Circulo de Cor selecionada
  late ThemeData _currentTheme; // Tema atual
  double brightness = 0.5; // Conf Brilho
  late MaterialTheme _materialTheme;
  double fontSize = 12.0; // Tamanho da fonte livro
  double fontSizeP = 34.0; // Tamanho da fonte palavra
  String selectedWord = 'OldBreadBook'; // Palavra selecionada
  int? selectedIndex; // Índice da palavra selecionada
  bool isPlaying = false; //Se a palavra esta sendo trocada
  double currentPPM = 200; // PPM inicial
  late int timerInterval; // Intervalo em milissegundos
  Timer? _timer; //temporizador
  bool showPpmText = false; // Controle para exibir o texto PPM
  Timer? _ppmTimer; //Resolver problema com Visualização
  bool isLocked = false; // Cadeado do texto


  @override
  void initState() {
    super.initState();
    // Configuração inicial do tema e carregamento do texto padrão
    _currentTheme = ThemeData.light();
    _loadDefaultText();
    _getCurrentBrightness();
    _materialTheme = MaterialTheme(_currentTheme.textTheme);

    _updateTimerInterval();

    // Seleção inicial da primeira palavra do texto carregado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedIndex = _getFirstWordIndex(_defaultText);
      });
    });
  }

  // Carrega o texto padrão do arquivo de recursos
  Future<void> _loadDefaultText() async {
    final String text = await rootBundle.loadString('assets/default_text.txt');
    setState(() {
      _defaultText = text;
    });
  }

  // Obtém o brilho atual da tela
  Future<void> _getCurrentBrightness() async {
    try {
      double currentBrightness = await ScreenBrightness().current;
      setState(() {
        brightness = currentBrightness;
      });
    } catch (e) {
      print("Erro ao obter o brilho atual: $e");
    }
  }

/////////////////////////////// TEMA ///////////////////////////////////////////////

  // Define o tema claro
  void _setLightTheme() {
    setState(() {
      _currentTheme = _materialTheme.light();
    });
  }

  // Define o tema claro com contraste médio
  void _setLightMediumContrastTheme() {
    setState(() {
      _currentTheme = _materialTheme.lightMediumContrast();
    });
  }

  // Define o tema claro com alto contraste
  void _setLightHighContrastTheme() {
    setState(() {
      _currentTheme = _materialTheme.lightHighContrast();
    });
  }

  // Define o tema escuro
  void _setDarkTheme() {
    setState(() {
      _currentTheme = _materialTheme.dark();
    });
  }

  // Define o tema escuro com contraste médio
  void _setDarkMediumContrastTheme() {
    setState(() {
      _currentTheme = _materialTheme.darkMediumContrast();
    });
  }

  // Define o tema escuro com alto contraste
  void _setDarkHighContrastTheme() {
    setState(() {
      _currentTheme = _materialTheme.darkHighContrast();
    });
  }

//////////////////////////////////////////////////////////////////////////////

  // Manipula a alteração do brilho
  void _handleBrightnessChange(double value) {
    setState(() {
      brightness = value;
    });
    ScreenBrightness().setScreenBrightness(value);
  }

/////////////////////////////////// FONTE ///////////////////////////////////////////

  // Manipula a alteração do tamanho da fonte do texto principal
  void _handleFontSizeChange(double value) {
    setState(() {
      fontSize = value;
    });
  }

  // Manipula a alteração do tamanho da fonte da palavra selecionada
  void _handleFontSizeChangeP(double value) {
    setState(() {
      fontSizeP = value;
    });
  }

/////////////////////////////////// LOGICA PRIMEIRA PALAVRA ///////////////////////////////////////////

  // Define o índice da primeira palavra do texto
  int? _getFirstWordIndex(String text) {
    final words = text.split(' ');
    if (words.isNotEmpty) {
      return 0; // O índice da primeira palavra é 0
    }
    return null;
  }

  // Armazena a palavra selecionada do texto
  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
      selectedWord = _defaultText.split(' ')[index];
    });
  }

  /////////////////////////////////// LOGICA TROCA PALAVRAS ///////////////////////////////////////////

  // Atualiza o intervalo do timer com base no PPM atual
  void _updateTimerInterval() {
    // Converte o PPM para milissegundos por palavra
    timerInterval = (60000 / currentPPM).round();
  }

// Inicia o avanço automático das palavras
  void _startPlaying() {
    _showPpmText();
    // Cria um Timer que chama _advanceWord no intervalo definido
    _timer = Timer.periodic(Duration(milliseconds: timerInterval), (timer) {
      _advanceWord();
    });
    // Atualiza o estado para refletir que o avanço automático está ativo
    setState(() {
      isPlaying = true;
    });
  }

// Pausa o avanço automático das palavras
  void _pausePlaying() {
    // Cancela o Timer se ele estiver ativo
    _timer?.cancel();
    // Atualiza o estado para refletir que o avanço automático está pausado
    setState(() {
      isPlaying = false;
    });
  }

// Avança para a próxima palavra no texto
  void _advanceWord() {
    setState(() {
      // Verifica se há uma próxima palavra disponível
      if (selectedIndex != null &&
          selectedIndex! < _defaultText.split(' ').length - 1) {
        // Atualiza o índice e a palavra selecionada para a próxima palavra
        selectedIndex = selectedIndex! + 1;
        selectedWord = _defaultText.split(' ')[selectedIndex!];
      } else {
        // Pausa o avanço automático se a última palavra for alcançada
        _pausePlaying();
        _showPpmText();
      }
    });
  }

// Aumenta a velocidade do PPM
  void _increasePPM() {
    setState(() {
      _showPpmText();
      // Incrementa o PPM atual em 10
      currentPPM += 10;
      // Atualiza o intervalo do timer com o novo PPM
      _updateTimerInterval();
      // Reinicia o timer para aplicar a nova velocidade imediatamente
      if (isPlaying) {
        _pausePlaying();
        _startPlaying();
      }
    });
  }

// Diminui a velocidade do PPM
  void _decreasePPM() {
    setState(() {
      _showPpmText();
      // Verifica se o PPM atual é maior que 10 para não ficar negativo
      if (currentPPM > 10) {
        // Decrementa o PPM atual em 10
        currentPPM -= 10;
        // Atualiza o intervalo do timer com o novo PPM
        _updateTimerInterval();
        // Reinicia o timer para aplicar a nova velocidade imediatamente
        if (isPlaying) {
          _pausePlaying();
          _startPlaying();
        }
      }
    });
  }

  // Mostrar PPM
  void _showPpmText() {
    showPpmText = true;
    _ppmTimer?.cancel();
    _ppmTimer = Timer(Duration(seconds: 3), () {
      showPpmText = false;
    });
  }

//////////////////////////////////////////////////////////////////////////////////////////////

//Cadeado
  void _toggleLock() {
    setState(() {
      isLocked = !isLocked;
    });
  }

  /////////////////////// Rolagem Texto principal ////////////////////////

/// Função para rolar até a palavra selecionada



///////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 60),
            // Widget para exibir a palavra no topo
            TopWordWidget(fonteSizedP: fontSizeP, selectedWord: selectedWord),
            const SizedBox(height: 10),
            // Widget para exibir o texto "PPM"
            showPpmText
                ? PpmTextWidget(ppm: currentPPM, fontSizeP: fontSizeP)
                : const SizedBox.shrink(),
            const SizedBox(height: 50),
            // Texto principal com funcionalidade de toque e menu
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Fecha o menu se ele estiver visível e expandido
                      if (isMenuVisible && isMenuExpanded) {
                        setState(() {
                          isMenuExpanded = false;
                        });
                        Future.delayed(const Duration(milliseconds: 350), () {
                          setState(() {
                            isMenuVisible = false;
                          });
                        });
                      } else if (isMenuVisible) {
                        setState(() {
                          isMenuVisible = false;
                        });
                      }
                    },
                    onDoubleTap: () {
                      // Alterna a visibilidade do menu ao dar um duplo toque
                      if (!isMenuExpanded) {
                        setState(() {
                          isMenuVisible = !isMenuVisible;
                        });
                      } else {
                        setState(() {
                          isMenuExpanded = !isMenuExpanded;
                          isMenuVisible = !isMenuVisible;
                        });
                      }
                    },
                    child: MainTextWidget(
                      selectedIndex: selectedIndex,
                      onWordTap: setSelectedIndex,
                      defaultText: _defaultText,
                      fontSize: fontSize,
                      isLocked: isLocked,
                    ),
                  ),
                  // Menu principal com várias opções
                  MainMenu(
                    isMenuVisible: isMenuVisible,
                    isMenuExpanded: isMenuExpanded,
                    onMenuTap: () {
                      setState(() {
                        isMenuExpanded = !isMenuExpanded;
                      });
                    },
                    onSubMenuTap: () {
                      setState(() {
                        isMenuExpanded = true;
                      });
                    },
                    selectedOption: selectedOption,
                    onOptionSelect: (option) {
                      if (option == MenuOption.lock) {
                        _toggleLock();
                      } else {
                        setState(() {
                          selectedOption = option;
                        });
                      }
                    },
                    brightness: brightness,
                    onBrightnessChanged: _handleBrightnessChange,
                    selectedCircle: selectedCircle,
                    onSelect: (circle) {
                      setState(() {
                        selectedCircle = circle;
                      });
                    },
                    setLightTheme: _setLightTheme,
                    setLightMediumContrastTheme: _setLightMediumContrastTheme,
                    setLightHighContrastTheme: _setLightHighContrastTheme,
                    setDarkTheme: _setDarkTheme,
                    setDarkMediumContrastTheme: _setDarkMediumContrastTheme,
                    setDarkHighContrastTheme: _setDarkHighContrastTheme,
                    fontSize: fontSize,
                    onFontSizeChanged: _handleFontSizeChange,
                    fontSizeP: fontSizeP,
                    onFontSizeChangedP: _handleFontSizeChangeP,
                    isLocked: isLocked,
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    bottom: isMenuVisible
                        ? (isMenuExpanded ? 300 : 50)
                        : 16, // Define a posição do controle de mídia
                    left: 0,
                    right: 0,
                    child: MainWordControl(
                      isPlaying: isPlaying,
                      onPlayPause: () {
                        if (isPlaying) {
                          _pausePlaying();
                        } else {
                          _startPlaying();
                        }
                      },
                      onNext: _increasePPM,
                      onPrevious: _decreasePPM,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}