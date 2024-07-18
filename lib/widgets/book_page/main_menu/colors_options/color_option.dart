import 'package:flutter/material.dart';
import 'package:old_bread/pages/book_page.dart'; 

// Widget para as opções de cor no sub-menu de paleta
class ColorOption extends StatelessWidget {
  // Opção de círculo selecionado
  final SelectedCircle circle;
  // Cor da opção
  final Color color;
  // Rótulo da opção
  final String label;
  // Widget de sub-opções para a cor
  final Widget subOptions;
  // Opção de círculo atualmente selecionado
  final SelectedCircle selectedCircle;
  // Função de callback ao selecionar a opção
  final Function(SelectedCircle) onSelect;

  const ColorOption({
    super.key,
    required this.circle,
    required this.color,
    required this.label,
    required this.subOptions,
    required this.selectedCircle,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedCircle == circle;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onSelect(circle);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: isSelected ? 35 : 30,
              backgroundColor: color,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(label),
        if (isSelected) subOptions,
      ],
    );
  }
}
