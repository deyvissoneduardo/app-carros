import 'dart:convert' as convert;

import 'package:app_carros/models/carro.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<CarroModel>> getCarros(String tipo) async {
    var url = Uri.parse(
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo');
    var response = await http.get(url);
    List list = convert.json.decode(response.body);
    return list.map<CarroModel>((map) => CarroModel.fromJson(map)).toList();
  }
}
