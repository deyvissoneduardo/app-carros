import 'package:app_carros/models/carro.dart';
import 'package:app_carros/pages/carro/loripsom_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarroPage extends StatefulWidget {
  CarroModel? carroModel;
  CarroPage({Key? key, this.carroModel}) : super(key: key);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final loripsonBloc = LoripsomBloc();

  @override
  void initState() {
    loripsonBloc.fetch();
    super.initState();
  }

  @override
  void dispose() {
    loripsonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carroModel!.nome!),
        actions: [
          IconButton(
            onPressed: _onClickMapa,
            icon: Icon(
              Icons.place_outlined,
            ),
          ),
          IconButton(
            onPressed: _onClickVideo,
            icon: Icon(
              Icons.videocam_outlined,
            ),
          ),
          PopupMenuButton(
            onSelected: _onClickPopUpMenu,
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Editar'), value: 'Editar'),
                PopupMenuItem(child: Text('Deletar'), value: 'Deletar'),
                PopupMenuItem(child: Text('Shared'), value: 'Shared'),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Image.network(widget.carroModel!.urlFoto!),
          rowInfo(),
          Divider(
            color: Colors.black,
          ),
          descricao(),
        ],
      ),
    );
  }

  Row rowInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.carroModel!.nome!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(widget.carroModel!.tipo!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: _onClickFavorite,
                icon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: _onClickShare,
                icon: Icon(
                  Icons.share_rounded,
                  size: 40,
                  color: Colors.black,
                )),
          ],
        )
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  void _onClickFavorite() {}

  void _onClickShare() {}

  descricao() {
    return Column(
      children: [
        Text(
          widget.carroModel!.descricao!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        StreamBuilder<String>(
            stream: loripsonBloc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Text Nulo');
              }
              return Text(snapshot.data!);
            })
      ],
    );
  }
}

_onClickPopUpMenu(value) {
  switch (value) {
    case 'Editar':
      print('Editar');
      break;
    case 'Deletar':
      print('Deletar');
      break;
    case 'Shared':
      print('Shared');
      break;
  }
}
