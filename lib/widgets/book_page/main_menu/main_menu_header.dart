import 'package:flutter/material.dart';
import 'package:old_bread/pages/book_page.dart';

// Widget para o cabeçalho do menu principal
class MainMenuHeader extends StatelessWidget {
  final bool isMenuExpanded;
  final Function(MenuOption) onOptionSelect;
  final Function onMenuTap;
  final Function onSubMenuTap;
  final bool isLocked;

  const MainMenuHeader({
    super.key,
    required this.isMenuExpanded,
    required this.onOptionSelect,
    required this.onMenuTap,
    required this.onSubMenuTap,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(Icons.palette, MenuOption.palette),
          _buildIconButton(Icons.text_fields, MenuOption.text),
          _buildIconButton(Icons.settings, MenuOption.settings),
          _buildLockButton(),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, MenuOption option) {
    return IconButton(
      onPressed: () {
        onOptionSelect(option);
        onSubMenuTap();
      },
      icon: Icon(icon),
    );
  }

  Widget _buildLockButton() {
    return IconButton(
      onPressed: () {
        onOptionSelect(MenuOption.lock);
      },
      icon: Icon(isLocked ? Icons.lock_open : Icons.lock),
    );
  }
}
