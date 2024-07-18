import 'package:flutter/material.dart';

// Widget para exibir o texto "PPM"
class PpmTextWidget extends StatelessWidget {
  final double ppm;
  final double fontSizeP;
  
  const PpmTextWidget({super.key, required this.ppm, required this.fontSizeP,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'PPM: ${ppm.toInt()}',
        style: TextStyle(
          fontSize: (fontSizeP*0.4),
          fontFamily: 'Arial',
          // Cor da fonte comentada no código original
          // color: Colors.black,
        ),
      ),
    );
  }
}
