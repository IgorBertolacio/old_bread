import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:old_bread/pages/book_page.dart';



LoginScreen(
    final BuildContext context,
    final double screenHeight,
    final double screenWidth,
    final ColorScheme colorScheme,

  ) {
    var container = SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FUTURA TELA DE LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OldBreadBook(),
                      ),
                    );
                  },
                  child: const Text('Entrar como Convidado'),
                ),
              ],
            ),
          );
    return SizedBox(
      height: screenHeight * 0.5,
      width: screenWidth,
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: container,
        ),
      ),
    );
  }