import 'package:flutter/material.dart';
import 'package:old_bread/widgets/first_page/theme.dart'; // Certifique-se de que este caminho está correto

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(animationValue: 3.0), 
        child: Container(), 
      ),
    );
  }
}
