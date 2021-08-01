import 'dart:convert';

import 'package:app_carros/data/api_response.dart';
import 'package:app_carros/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<UsuarioModel>> login(
      String login, String senha) async {
    try {
      var url =
          Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

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
      Map<String, dynamic> map = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = UsuarioModel.fromJson(map);
        user.save();
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(map['error']);
    } on Exception catch (e) {
      print(e);
      return ApiResponse.error('Nao foi possivel completa login');
    }
  }
}
