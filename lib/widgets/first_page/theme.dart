import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Desenhamos o retângulo, -- tela inteira
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    // Fizemos um desenho de Gradiente
    Gradient BgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.lerp(
            const Color.fromRGBO(251, 251, 252, 0.984),
            const Color.fromRGBO(9, 9, 13, 1),
            animationValue)!, // Interpolação entre duas cores
        Color.lerp(
            const Color.fromRGBO(217, 217, 217, 1),
            const Color.fromRGBO(44, 49, 64, 1),
            animationValue)!, // Interpolação entre outras duas cores
      ],
      stops: const [0.0, 1.0],
    );

    // Pintamos o retângulo
    final Paint BgGradiente = Paint()..shader = BgGradient.createShader(rect);
    canvas.drawRect(rect, BgGradiente);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class AnimationPainter extends CustomPainter {
  final double animationValue;

  AnimationPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Pintamos os pontos da luz
    List<Offset> relativePoints = [
      Offset(size.width * 0.01 * animationValue,
          size.height * 0.1 * animationValue),
      Offset(
          size.width * -2 * animationValue, size.height * 0.2 * animationValue),
      Offset(size.width * 0.001 * animationValue,
          size.height * 0.3 * animationValue),
      Offset(size.width * 0.2 * animationValue,
          size.height * 0.99 * animationValue),
      Offset(size.width * 0.9 * animationValue,
          size.height * 0.99 * animationValue),
    ];

    // Ligamos os pontos da luz
    Path lightPath = Path()
      ..moveTo(relativePoints[0].dx, relativePoints[0].dy)
      ..lineTo(relativePoints[1].dx, relativePoints[1].dy)
      ..lineTo(relativePoints[2].dx, relativePoints[2].dy)
      ..lineTo(relativePoints[3].dx, relativePoints[3].dy)
      ..lineTo(relativePoints[4].dx, relativePoints[4].dy)
      ..close();

    // Pintamos o gradiente da luz
    Paint paintPath = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFCBAB), Color(0xFFFBDDC0), Color(0x00737373)],
        stops: [0.0, 0.39, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50)
      ..style = PaintingStyle.fill;

    // Pintamos a luz com o gradiente
    canvas.drawPath(lightPath, paintPath);

    // Desenhamos o círculo
    double radius = size.width * 0.3 * animationValue;
    Offset center = Offset(size.width / 2, size.height / 1.6);

    // Pintamos a cor
    Paint paintCircle = Paint()
      ..color = const Color.fromARGB(77, 92, 99, 115)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    // Pintamos a cor no círculo
    canvas.drawCircle(center, radius, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclerUP extends CustomPainter {
  final double animationValue;

  CirclerUP({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width * 0.5 * animationValue;
    Offset center = Offset(size.width /2, size.height / 1.6);

    Paint paintCircle = Paint()
      ..color = const Color.fromARGB(77, 92, 99, 115)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 200);

    canvas.drawCircle(center, radius, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}