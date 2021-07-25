import 'package:app_carros/data/carros_api.dart';
import 'package:app_carros/drawer_list.dart';
import 'package:app_carros/models/carro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return Card(
            color: Colors.grey[150],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      '${c.urlFoto}',
                      width: 250,
                    ),
                  ),
                  Text(
                    '${c.nome}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Descrição',
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: [
                        TextButton(onPressed: () {}, child: Text('DETALHES')),
                        TextButton(onPressed: () {}, child: Text('SHARED')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
