import 'dart:convert' as convert;

import 'package:app_carros/utils/prefes.dart';

class UsuarioModel {
  String? login;
  String? nome;
  String? email;
  String? urlFoto;
  String? token;
  List<String>? roles;

  UsuarioModel(
      {this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString('user.prefes', json);
  }

  static Future<UsuarioModel?> get() async {
    String json = await Prefs.getString('user.prefes');
    if (json.isEmpty) return null;
    Map<String, dynamic> map = convert.json.decode(json);
    return UsuarioModel.fromJson(map);
  }

  @override
  String toString() {
    return 'UsuarioModel(login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles)';
  }

  static void clear() {
    Prefs.setString('user.prefes', '');
  }
}
