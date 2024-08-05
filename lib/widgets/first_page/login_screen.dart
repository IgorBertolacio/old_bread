import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:old_bread/components/decoration.dart';
import 'package:old_bread/pages/book_page.dart';
import 'package:old_bread/widgets/first_page/theme.dart';

class LoginScreen extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final ColorScheme colorScheme;
  final double scrollOffset;
  final double animationValue;

  const LoginScreen(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.colorScheme,
      required this.scrollOffset,
      required this.animationValue});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _cadastrado = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight,
      width: widget.screenWidth,
      child: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: widget.screenHeight / 4,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: CirclerUP(animationValue: widget.animationValue),
                    child: SvgPicture.asset(
                        'assets/icons_svg/lateral_sentado.svg'),
                  ),
                ),
                //const SizedBox(height: 30),
                LoginScheme(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


Padding LoginScheme(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0), 
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                    decoration: getAuthenticationInputDecoration('E-mail')),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: getAuthenticationInputDecoration('Senha'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: !_cadastrado,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            getAuthenticationInputDecoration('Confirme a Senha'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration:
                            getAuthenticationInputDecoration('Nome do Usuario'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                       style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
                        ),
                      ),
                      child: Text(_cadastrado ? 'Login' : 'Cadastre-se'),
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
                       style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
                        ),
                      ),
                      child: const Text('Entrar como Convidado'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _cadastrado = !_cadastrado;
                        });
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
                        ),
                      ),
                      child: Text(_cadastrado
                          ? 'Ainda não tem uma conta? Cadastre-se'
                          : 'Já tem uma conta? Entre!'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

  }

