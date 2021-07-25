import 'dart:convert';

import 'package:flutter/foundation.dart';

class UsuarioModel {
  String? nome;
  String? login;
  String? email;
  String? token;
  List<String>? roles;

  UsuarioModel.fromJson(Map<String, dynamic> map) {
    nome = map['nome'];
    login = map['login'];
    email = map['email'];
    token = map['token'];
  }

  @override
  String toString() {
    return 'UsuarioModel(nome: $nome, login: $login, email: $email, token: $token, roles: $roles)';
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'login': login,
      'email': email,
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsuarioModel &&
        other.nome == nome &&
        other.login == login &&
        other.email == email &&
        other.token == token &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        login.hashCode ^
        email.hashCode ^
        token.hashCode ^
        roles.hashCode;
  }
}
