import 'dart:ui';
import 'package:daat_flow/comun/sanckbar_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/decoration.dart';
import '../main.dart';
import 'book_page.dart';
import '../services/authentication_services.dart';
import '../widgets/first_page/theme.dart';
import '../widgets/first_page/validadores.dart';

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

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight,
      width: widget.screenWidth,
      child: Form(
        key: _formKey,
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

  bool _cadastrado = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNametroller = TextEditingController();
  final AuthServices _authServices = AuthServices();

  Padding LoginScheme(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: widget.screenHeight / 2,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: getAuthenticationInputDecoration('E-mail'),
                    validator: emailValidator,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration('Senha'),
                    controller: _passwordController,
                    obscureText: true,
                    validator: passwordValidator,
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: !_cadastrado,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: getAuthenticationInputDecoration(
                              'Confirme a Senha'),
                          obscureText: true,
                          controller: _confirmPasswordController,
                          validator: (value) => confirmPasswordValidator(
                              value, _passwordController.text),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: _userNametroller,
                            decoration: getAuthenticationInputDecoration(
                                'Nome do Usuario'),
                            validator: usernameValidator),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          onLogin();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Bordas arredondadas
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
                            borderRadius: BorderRadius.circular(
                                15), // Bordas arredondadas
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
                            borderRadius: BorderRadius.circular(
                                15), // Bordas arredondadas
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

  onLogin() {
    String userName = _userNametroller.text;
    String password = _passwordController.text;
    String email = _emailController.text;

    if (_formKey.currentState!.validate()) {
      if (_cadastrado) {
        logger.info("Entrada Validada");
        _authServices.LoginUser(email: email, password: password).then(
          (String? erro) {
            if (erro != null) {
              ShowSnackbar(context: context, value: erro);
            }
          },
        );
      } else {
        logger.info("Cadastro Validado");
        logger.info(
            "${_emailController.text}, ${_passwordController.text}, ${_userNametroller.text}");
        _authServices
            .userCadastro(email: email, password: password, userName: userName)
            .then((String? erro) {
          if (erro != null) {
            ShowSnackbar(
              context: context,
              value: erro,
            );
          } else {
            ShowSnackbar(
                context: context, value: "Usuario Cadastrado", isErro: false);
            setState(() {
              _cadastrado = true;
            });
          }
        });
      }
    } else {
      logger.warning("invalido");
    }
  }
}
