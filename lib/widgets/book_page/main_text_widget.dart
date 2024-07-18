import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Widget para o controle de texto principal
class MainTextWidget extends StatelessWidget {
  // Tamanho da fonte do texto principal
  final double fontSize;
  // Texto padrão carregado
  final String defaultText;
  // Índice da palavra selecionada
  final int? selectedIndex;
  // Função de callback ao tocar em uma palavra
  final Function(int) onWordTap;
  // Cadeado
  final bool isLocked;

  const MainTextWidget({
    super.key,
    required this.defaultText,
    required this.fontSize,
    required this.selectedIndex,
    required this.onWordTap, 
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = []; // Lista que irá conter os spans de texto
    List<String> words = defaultText.split(' '); // Divide o texto em palavras

    // Estilo padrão, usando o tema atual do contexto
    TextStyle defaultStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: fontSize);
    
    // Estilo para a palavra selecionada, com fundo amarelo e texto preto
    TextStyle selectedStyle = defaultStyle.copyWith(
      backgroundColor: Colors.yellow, // Fundo amarelo para a palavra selecionada
      color: Colors.black,
      fontSize: fontSize + 3, // Texto preto para a palavra selecionada
    );

    // Cria um TextSpan para cada palavra
    for (int i = 0; i < words.length; i++) {
      bool isSelected = i == selectedIndex; // Verifica se a palavra é a selecionada
      textSpans.add(
        TextSpan(
          text: '${words[i]} ', // Texto da palavra com espaço
          style: isSelected ? selectedStyle : defaultStyle, // Aplica o estilo adequado
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (isLocked) { // Apenas chama a função de callback se não estiver bloqueado
                onWordTap(i);
                } 
            },
        ),
      );
    }

    // Retorna o widget completo
    return SizedBox(
      height: double.infinity, // Ocupa toda a altura disponível
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Adiciona padding ao redor do texto
        child: RichText(
          text: TextSpan(children: textSpans), // Constrói o RichText com os spans criados
        ),
      ),
    );
  }
}


// TextSpan é um pedaço de texto que pode ter seu próprio estilo.
// RichText é um widget que permite exibir texto com múltiplos estilos