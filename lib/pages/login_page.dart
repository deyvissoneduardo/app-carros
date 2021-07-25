import 'package:app_carros/data/api_response.dart';
import 'package:app_carros/data/login_api.dart';
import 'package:app_carros/models/usuario_model.dart';
import 'package:app_carros/utils/alert.dart';
import 'package:app_carros/utils/navigator.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'widgets/app_buttom.dart';
import 'widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final tLogin = TextEditingController(text: 'user');
  final tSenha = TextEditingController(text: '123');
  final formKey = GlobalKey<FormState>();
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carros'),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AppText(
                label: 'Login',
                hint: 'email',
                obscureText: false,
                controller: tLogin,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo Invalido';
                  return null;
                }),
            const SizedBox(height: 10),
            AppText(
              label: 'Senha',
              hint: '123',
              obscureText: true,
              controller: tSenha,
              validator: (value) {
                if (value!.isEmpty) return 'Campo Invalido';
                return null;
              },
            ),
            const SizedBox(height: 10),
            AppButtom(
              text: 'Login',
              onPressed: () => _onClickLogin(context),
              showProgess: showProgress,
            )
          ],
        ),
      ),
    );
  }

  _onClickLogin(context) async {
    bool formOk = formKey.currentState!.validate();
    if (!formOk) return;
    String login = tLogin.text;
    String senha = tSenha.text;
    setState(() {
      showProgress = true;
    });
    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      // ignore: unused_local_variable
      UsuarioModel usuarioModel = response.result;
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg!);
    }
    setState(() {
      showProgress = false;
    });
  }
}
