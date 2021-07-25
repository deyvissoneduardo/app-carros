import 'package:app_carros/drawer_list.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: Text('Logado'),
      ),
      drawer: DrawerList(),
    );
  }
}
