import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:screen_brightness/screen_brightness.dart';
import '../comun/themeBread.dart';
import '../widgets/book_page/main_menu/main_menu.dart';
import '../widgets/book_page/main_text_widget.dart';
import '../widgets/book_page/ppm_text_widget.dart';
import '../widgets/book_page/top_word_widget.dart';
import '../widgets/book_page/word_control/main_word_control.dart';

// Enum para as opções do menu
enum MenuOption { none, palette, text, settings, lock }

// Enum para os círculos selecionados
enum SelectedCircle { none, oldBread, dark, white }

// Enum para seleção de tema
enum ThemeType {
  light,
  lightMediumContrast,
  lightHighContrast,
  dark,
  darkMediumContrast,
  darkHighContrast,
}

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
  String defaultTextProcess = ''; // Texto padrão processado
  MenuOption selectedOption = MenuOption.none; // Opção selecionada
  SelectedCircle selectedCircle =
      SelectedCircle.none; // Circulo de Cor selecionada
  late ThemeData _currentTheme; // Tema atual
  double brightness = 0.5; // Conf Brilho
  late MaterialTheme _materialTheme;
  double fontSize = 12.0; // Tamanho da fonte livFro
  double fontSizeP = 34.0; // Tamanho da fonte palavra
  String selectedWord = 'OldBreadBook'; // Palavra selecionada
  int selectedIndex = 0; // Índice da palavra selecionada
  bool isPlaying = false; //Se a palavra esta sendo trocada
  double currentPPM = 60; // PPM inicial
  late int timerInterval; // Intervalo em milissegundos
  Timer? _timer; //temporizador
  bool showPpmText = false; // Controle para exibir o texto PPM
  Timer? _ppmTimer; //Resolver problema com Visualização
  bool isLocked = true; // Cadeado do texto
  bool switchValue = false; // valor Switch PPM CPM
  double cpmAdjustmentFactor = 5.0; // ajuste CPM

  @override
  void initState() {
    super.initState();
    _currentTheme = ThemeData.dark();
    _loadDefaultText();
    _getCurrentBrightness();
    _materialTheme = MaterialTheme(_currentTheme.textTheme);
    _updateTimerInterval();
  }

  // Carrega o texto padrão do arquivo de recursos
  Future<void> _loadDefaultText() async {
    final String text =
        await rootBundle.loadString('assets/text/default_text.txt');
    setState(() {
      _defaultText = text;
      defaultTextProcess = _processText(text);
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
      debugPrint("Erro ao obter o brilho atual: $e");
    }
  }

  // Manipula a alteração do brilho
  void _handleBrightnessChange(double value) {
    setState(() {
      brightness = value;
    });
    ScreenBrightness().setScreenBrightness(value);
  }

  // Define o tema
  void setTheme(ThemeType themeType) {
    setState(() {
      switch (themeType) {
        case ThemeType.light:
          _currentTheme = _materialTheme.light();
          break;
        case ThemeType.lightMediumContrast:
          _currentTheme = _materialTheme.lightMediumContrast();
          break;
        case ThemeType.lightHighContrast:
          _currentTheme = _materialTheme.lightHighContrast();
          break;
        case ThemeType.dark:
          _currentTheme = _materialTheme.dark();
          break;
        case ThemeType.darkMediumContrast:
          _currentTheme = _materialTheme.darkMediumContrast();
          break;
        case ThemeType.darkHighContrast:
          _currentTheme = _materialTheme.darkHighContrast();
          break;
      }
    });
  }

// Manipula a alteração do tamanho da fonte
  void _handleFontSizeChange(String type, double value) {
    setState(() {
      if (type == 'livro') {
        fontSize = value;
      } else if (type == 'palavra') {
        fontSizeP = value;
      }
    });
  }

  // Armazena a palavra selecionada do texto
  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
      selectedWord = defaultTextProcess.split(' ')[index];
    });
  }

  // Tratmento de texto PROVISORIO
  String _processText(String text) {
    // Remover todos os quebras de linha
    text = text.replaceAll('\n', '');
    text = text.replaceAll('.', '. ');
    text = text.replaceAll(',', ', ');
    while (text.contains('  ')) {
      text = text.replaceAll('  ', ' ');
    }
    return text;
  }

  // Atualiza o intervalo do timer com base no PPM ou CPM atual
  void _updateTimerInterval() {
    if (switchValue) {
      // CPM: Calcula o intervalo baseado nos caracteres por minuto
      final int charCount = selectedWord.length;
      timerInterval =
          ((60000 / (currentPPM / charCount)) / cpmAdjustmentFactor).round();
    } else {
      // PPM: Converte o PPM para milissegundos por palavra
      timerInterval = (60000 / currentPPM).round();
    }
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
      if (selectedIndex < defaultTextProcess.split(' ').length - 1) {
        // Atualiza o índice e a palavra selecionada para a próxima palavra
        selectedIndex += 1;
        selectedWord = defaultTextProcess.split(' ')[selectedIndex];
        // Atualiza o intervalo do timer com base na nova palavra
        _updateTimerInterval();
        _timer?.cancel();
        _startPlaying();
      } else {
        // Pausa o avanço automático se a última palavra for alcançada
        _pausePlaying();
      }
    });
  }

// Aumenta ou diminui o PPM atual
  void _changePPM(bool increase) {
    setState(() {
      _showPpmText();
      currentPPM = increase
          ? currentPPM + 10
          : (currentPPM > 10 ? currentPPM - 10 : currentPPM);
      _updateTimerInterval();

      if (isPlaying) {
        _pausePlaying();
        _startPlaying();
      }
    });
  }

// Mostrar PPM
  void _showPpmText() {
    showPpmText = true;
    _ppmTimer?.cancel();
    _ppmTimer = Timer(const Duration(seconds: 3), () {
      showPpmText = false;
    });
  }

// Cadeado Aberto ou fechado
  void _toggleLock() {
    setState(() {
      isLocked = !isLocked;
    });
  }

  //Switch modo leitura
  void onSwitchChanged(bool value) {
    setState(() {
      switchValue = value;
    });
  }

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
                      defaultTextProcess: defaultTextProcess,
                      selectedIndex: selectedIndex,
                      onWordTap: setSelectedIndex,
                      defaultText: _defaultText,
                      fontSize: fontSize,
                      isLocked: isLocked,
                    ),
                  ),
                  // Menu principal
                  MainMenu(
                    isMenuVisible: isMenuVisible,
                    isMenuExpanded: isMenuExpanded,
                    switchValue: switchValue,
                    onSwitchChanged: onSwitchChanged,
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
                    setLightTheme: () => setTheme(ThemeType.light),
                    setLightMediumContrastTheme: () =>
                        setTheme(ThemeType.lightMediumContrast),
                    setLightHighContrastTheme: () =>
                        setTheme(ThemeType.lightHighContrast),
                    setDarkTheme: () => setTheme(ThemeType.dark),
                    setDarkMediumContrastTheme: () =>
                        setTheme(ThemeType.darkMediumContrast),
                    setDarkHighContrastTheme: () =>
                        setTheme(ThemeType.darkHighContrast),
                    fontSize: fontSize,
                    onFontSizeChanged: (value) =>
                        _handleFontSizeChange('livro', value),
                    fontSizeP: fontSizeP,
                    onFontSizeChangedP: (value) =>
                        _handleFontSizeChange('palavra', value),
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
                      onNext: () => _changePPM(true),
                      onPrevious: () => _changePPM(false),
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
