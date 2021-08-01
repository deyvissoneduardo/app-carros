import 'package:app_carros/models/tipo_carro.dart';
import 'package:app_carros/pages/carro/list_view_carro.dart';
import 'package:app_carros/utils/prefes.dart';
import 'package:flutter/material.dart';

import '../drawer_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController? _tabController;

  @override
  initState() {
    _initTab();
    super.initState();
  }

  _initTab() async {
    int tabIdx = await Prefs.getInt("tabIdx");
    _tabController = TabController(length: 3, vsync: this);
    setState(() {
      _tabController!.index = tabIdx;
    });
    _tabController!.addListener(() {
      Prefs.setInt("tabIdx", _tabController!.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Clássicos'),
            Tab(text: 'Esportivos'),
            Tab(text: 'Luxuosos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListViewCarro(tipo: TipoCarro.classico!),
          ListViewCarro(tipo: TipoCarro.esportivos!),
          ListViewCarro(tipo: TipoCarro.luxo!),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
