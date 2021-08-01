import 'dart:async';

import 'package:app_carros/data/api_response.dart';
import 'package:app_carros/data/login_api.dart';
import 'package:app_carros/models/usuario_model.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();
  get stream => _streamController.stream;

  Future<ApiResponse<UsuarioModel>> login(String login, String senha) async {
    _streamController.add(true);
    ApiResponse<UsuarioModel> result = await LoginApi.login(login, senha);
    _streamController.add(false);
    return result;
  }

  void dispose() {
    _streamController.close();
  }
}
