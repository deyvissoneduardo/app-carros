import 'dart:convert';

import 'package:app_carros/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<UsuarioModel> login(String login, String senha) async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

    Map params = {
      'username': login,
      'password': senha,
    };

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    String convertString = json.encode(params);

    var response = await http.post(
      url,
      body: convertString,
      headers: headers,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> map = json.decode(response.body);
    final user = UsuarioModel.fromJson(map);

    return user;
  }
}
