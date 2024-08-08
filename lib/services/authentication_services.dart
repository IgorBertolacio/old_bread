import 'package:daat_flow/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Pegar e tratar erros no cadastro
  Future<String?> userCadastro({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(userName);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          logger.warning("Email já está em uso.");
          return "Email já está em uso.";
        case "invalid-email":
          logger.warning("Email inválido.");
          return "Email inválido.";
        case "operation-not-allowed":
          logger.warning("Operação não permitida.");
          return "Operação não permitida.";
        case "weak-password":
          logger.warning("A senha é muito fraca.");
          return "A senha é muito fraca.";
        default:
          logger.warning("Ocorreu um erro: ${e.message}");
          return "Ocorreu um erro: ${e.message}";
      }
    } catch (e) {
      logger.severe("Erro inesperado: $e");
      return "Erro inesperado: $e";
    }
  }

  // Logar Usuario
  Future<String?> LoginUser(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> Logon() async {
    return _firebaseAuth.signOut();
  }
}
