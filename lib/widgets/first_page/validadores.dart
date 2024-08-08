String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'E-mail não pode ser vazio';
  }
  // Regex para validar formato de e-mail
  String pattern =
      r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Formato de e-mail inválido';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Senha não pode ser vazia';
  }
  if (value.length < 6) {
    return 'Senha deve ter pelo menos 6 caracteres';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirmação de senha não pode ser vazia';
  }
  if (value != password) {
    return 'As senhas não coincidem';
  }
  return null;
}

String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nome de usuário não pode ser vazio';
  }
  if (value.length < 3) {
    return 'Nome de usuário deve ter pelo menos 3 caracteres';
  }
  return null;
}
