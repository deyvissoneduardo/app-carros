import 'package:app_carros/models/carro.dart';
import 'package:app_carros/pages/carro/carro_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewCarro extends StatefulWidget {
  String tipo;
  ListViewCarro({Key? key, required this.tipo}) : super(key: key);

  @override
  _ListViewCarroState createState() => _ListViewCarroState();
}

class _ListViewCarroState extends State<ListViewCarro>
    with AutomaticKeepAliveClientMixin<ListViewCarro> {
  final bloc = CarroBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    bloc.loadData(widget.tipo);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: bloc.straem,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
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
        if (!snapshot.hasData) {
          Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
          ));
        }

        List<CarroModel>? carros = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return _listView(carros!);
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
                        TextButton(
                            onPressed: () {
                              print('aqui ${c.id}');
                            },
                            child: Text('DETALHES')),
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
