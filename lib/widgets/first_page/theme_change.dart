import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThemeChangeWidgets extends StatelessWidget {
  final double topPadding;
  final double containerTitleHeight;
  final double containerTitleWidth;
  final ColorScheme colorScheme;
  final double bottomPadding;
  final double containerSVGHeight;
  final double containerSVGWidth;
  final double scrollOffset;
  final bool themeTap;

  const ThemeChangeWidgets(
      {super.key,
      required this.topPadding,
      required this.containerTitleHeight,
      required this.containerTitleWidth,
      required this.colorScheme,
      required this.bottomPadding,
      required this.containerSVGHeight,
      required this.containerSVGWidth,
      required this.scrollOffset,
      required this.themeTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Titulo(
            topPadding, containerTitleHeight, containerTitleWidth, colorScheme),
        SubTitulo(containerSVGHeight, containerSVGWidth, colorScheme),
        SvgBook(bottomPadding, containerSVGHeight, containerSVGWidth),
      ],
    );
  }

  Widget SvgBook(double bottomPadding, double containerSVGHeight,
      double containerSVGWidth) {
    return Transform.translate(
      offset: Offset(0, scrollOffset * -0.5),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: SizedBox(
          height: containerSVGHeight,
          width: containerSVGWidth,
          child: SvgPicture.asset('assets/icons_svg/logo_dark.svg'),
        ),
      ),
    );
  }

  Widget SubTitulo(double containerSVGHeight, double containerSVGWidth,
      ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Transform.translate(
        offset: Offset(0, scrollOffset * -0.4),
        child: Container(
          alignment: Alignment.topCenter,
          height: containerSVGHeight / 4,
          width: containerSVGWidth,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.white],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontFamily: 'EBGaramond',
                    fontSize: 5000,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  child: AutoSizeText(
                    themeTap ? 'MoonMode' : 'LightMode',
                    maxLines: 1,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.transparent],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Titulo(double topPadding, double containerTitleHeight,
      double containerTitleWidth, ColorScheme colorScheme) {
    return Transform.translate(
      offset: Offset(0, scrollOffset * -0.3),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: SizedBox(
          height: containerTitleHeight,
          width: containerTitleWidth,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              style: TextStyle(
                color: colorScheme.onSurface,
                fontFamily: 'EBGaramond',
                fontSize: 5000,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
              child: const AutoSizeText(
                'DAATFLOW',
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
