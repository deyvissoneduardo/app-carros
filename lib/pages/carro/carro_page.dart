import 'dart:async';

import 'package:app_carros/models/carro.dart';
import 'package:flutter/material.dart';

import 'carro_bloc.dart';
import 'list_view_carro.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  String get tipo => widget.tipo;

  final _bloc = CarroBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.loadData(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.straem,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Não foi possível buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container();
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.loadData(tipo);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
