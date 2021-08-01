import 'dart:async';

import 'package:app_carros/data/carros_api.dart';
import 'package:app_carros/models/carro.dart';

class CarroBloc {
  final _streamController = StreamController<List<CarroModel>>();
  get straem => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  loadData(String tipo) async {
    try {
      List<CarroModel> listCarro = await CarrosApi.getCarros(tipo);
      _streamController.add(listCarro);
    } on Exception catch (e) {
      _streamController.addError(e);
    }
  }
}
