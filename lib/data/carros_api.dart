import 'package:app_carros/models/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = <Carro>[];
    carros.add(Carro(nome: 'carro1'));
    carros.add(Carro(nome: 'carro2'));
    carros.add(Carro(nome: 'carro3'));
    return carros;
  }
}
