import 'package:flutter/material.dart';
import 'package:old_bread/widgets/first_page/login_screen.dart';
import 'package:old_bread/widgets/first_page/theme.dart';
import 'package:old_bread/themeBread.dart';
import 'package:old_bread/widgets/first_page/theme_change.dart';

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
  double _ScrollOffset = 0.0;
  late PageController _scrollController;
  

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

    _scrollController = PageController()
      ..addListener(() {
        setState(() {
          _ScrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
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
        body: Stack(
              children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: BackgroundPainter(animationValue: _animation.value),
              child: CustomPaint(
                painter: AnimationPainter(animationValue: _animation.value),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //ThemeChenge
                        ThemeChangeWidgets(
                          topPadding: topPadding,
                          containerTitleHeight: containerTitleHeight,
                          containerTitleWidth: containerTitleWidth,
                          colorScheme: colorScheme,
                          bottomPadding: bottomPadding,
                          containerSVGHeight: containerSVGHeight,
                          containerSVGWidth: containerSVGWidth,
                          scrollOffset: _ScrollOffset,
                          themeTap: themeTap,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // Tela Login
        PageView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GestureDetector(
                  onTap: oneTapScreen,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),),
            LoginScreen(
              
              screenHeight : screenHeight,
              screenWidth : screenWidth,
              colorScheme : colorScheme,
              scrollOffset: _ScrollOffset,
              animationValue: _animation.value
              
            ),
          ],
        )
              ],
            ));
  }
}
