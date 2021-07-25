import 'package:app_carros/drawer_list.dart';
import 'package:app_carros/models/tipo_carro.dart';
import 'package:app_carros/pages/list_view_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Clássicos'),
              Tab(text: 'Esportivos'),
              Tab(text: 'Luxuosos'),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListViewBody(tipo: TipoCarro.classico!),
          ListViewBody(tipo: TipoCarro.esportivos!),
          ListViewBody(tipo: TipoCarro.luxo!),
        ]),
        drawer: DrawerList(),
      ),
    );
  }
}
