import 'package:app_carros/models/carro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarroPage extends StatelessWidget {
  CarroModel? carroModel;
  CarroPage({Key? key, this.carroModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(carroModel!.nome!),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Image.network(carroModel!.urlFoto!),
    );
  }
}
