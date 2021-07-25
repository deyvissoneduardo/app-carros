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
    return FutureBuilder(
      future: CarrosApi.getCarros(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          return Text(
            'Nao foi possivel carregar',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          );
        }
        if (!snapshot.hasData) Center(child: CircularProgressIndicator());
        List<CarroModel> carros = snapshot.data;
        return _listView(carros);
      },
    );
  }

  _listView(List<CarroModel> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.isNotEmpty ? carros.length : 0,
        itemBuilder: (context, index) {
          CarroModel c = carros[index];
          return Card(
            color: Colors.grey[150],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: c.urlFoto != null
                          ? Image.network(
                              '${c.urlFoto}',
                              width: 250,
                            )
                          : Image.network(
                              'http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png',
                              width: 250,
                            )),
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
