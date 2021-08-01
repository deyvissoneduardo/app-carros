import 'package:flutter/material.dart';

import 'models/usuario_model.dart';
import 'pages/login/login_page.dart';
import 'utils/navigator.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<UsuarioModel?>(
                future: UsuarioModel.get(),
                builder: (context, snapshot) {
                  UsuarioModel? usuarioModel = snapshot.data;
                  return usuarioModel != null
                      ? _header(usuarioModel)
                      : Container();
                }),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _onclick(context))
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(UsuarioModel usuarioModel) {
    return UserAccountsDrawerHeader(
      accountName: Text('${usuarioModel.nome}'),
      accountEmail: Text('${usuarioModel.email}'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage('${usuarioModel.urlFoto}'),
      ),
    );
  }

  _onclick(BuildContext context) {
    Navigator.pop(context);
    UsuarioModel.clear();
    push(context, LoginPage(), replace: true);
  }
}
