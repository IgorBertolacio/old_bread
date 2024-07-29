import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_bread/pages/book_page.dart';
import 'dart:ui';
import 'package:old_bread/widgets/first_page/theme.dart';
import 'package:old_bread/themeBread.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  bool themeTap = true;
  late AnimationController _controller;
  late Animation<double> _animation;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (themeTap) {
      _controller.forward();
    }
  }

  void oneTapScreen() {
    setState(() {
      themeTap = !themeTap;
      if (themeTap) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        themeTap ? MaterialTheme.darkScheme() : MaterialTheme.lightScheme();

    // Variables for screen proportions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // Container SVG
    final containerSVGHeight = screenHeight * 0.4;
    final containerSVGWidth = screenWidth * 0.5;
    // Container title
    final containerTitleHeight = screenHeight * 0.08;
    final containerTitleWidth = screenWidth * 0.5;
    // padding
    final topPadding = screenHeight * 0.10;
    final bottomPadding = screenHeight * 0.10;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _scrollOffset = scrollNotification.metrics.pixels;
            });
          }
          return true;
        },
        child: GestureDetector(
          onTap: oneTapScreen,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundPainter(animationValue: _animation.value),
                child: CustomPaint(
                  painter: AnimationPainter(animationValue: _animation.value),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(0, _scrollOffset * 0.2),
                          child: Titulo(
                            topPadding,
                            containerTitleHeight,
                            containerTitleWidth,
                            colorScheme,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, _scrollOffset * 0.5),
                          child: SubTitulo(
                            containerSVGHeight,
                            containerSVGWidth,
                            colorScheme,
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Transform.translate(
                          offset: Offset(0, _scrollOffset * 0.1),
                          child: SvgBook(
                            bottomPadding,
                            containerSVGHeight,
                            containerSVGWidth,
                          ),
                        ),
                        LoginScreen(screenHeight, screenWidth, colorScheme),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container LoginScreen(
      double screenHeight, double screenWidth, ColorScheme colorScheme) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            color: colorScheme.surfaceContainer.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FUTURA TELA DE LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
                // Add any other login elements here
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OldBreadBook(),
                      ),
                    );
                  },
                  child: Text('Entrar como Convidado'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding SvgBook(double bottomPadding, double containerSVGHeight,
      double containerSVGWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: SizedBox(
        height: containerSVGHeight,
        width: containerSVGWidth,
        child: SvgPicture.asset('assets/icons_svg/logo_dark.svg'),
      ),
    );
  }

  Container SubTitulo(double containerSVGHeight, double containerSVGWidth,
      ColorScheme colorScheme) {
    return Container(
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
    );
  }

  Padding Titulo(double topPadding, double containerTitleHeight,
      double containerTitleWidth, ColorScheme colorScheme) {
    return Padding(
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
    );
  }
}
