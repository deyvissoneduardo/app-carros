import 'package:app_carros/data/carros_api.dart';
import 'package:app_carros/models/carro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewBody extends StatefulWidget {
  String tipo;
  ListViewBody({Key? key, required this.tipo}) : super(key: key);

  @override
  _ListViewBodyState createState() => _ListViewBodyState();
}

class _ListViewBodyState extends State<ListViewBody>
    with AutomaticKeepAliveClientMixin<ListViewBody> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    return FutureBuilder(
      future: CarrosApi.getCarros(widget.tipo),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print(snapshot.hasError);
          return Center(
            child: Text(
              'Nao foi possivel carregar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
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
