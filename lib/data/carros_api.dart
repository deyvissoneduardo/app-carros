import 'dart:convert' as convert;

import 'package:app_carros/models/carro.dart';
import 'package:app_carros/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<CarroModel>> getCarros(String tipo) async {
    UsuarioModel? usuarioModel = await UsuarioModel.get();

    var url = Uri.parse(
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${usuarioModel!.token!}'
    };
    var response = await http.get(url, headers: headers);

    List list = convert.json.decode(response.body);
    return list.map<CarroModel>((map) => CarroModel.fromJson(map)).toList();
  }
}
