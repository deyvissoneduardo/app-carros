import 'dart:async';

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
  final tLogin = TextEditingController();
  final tSenha = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _streamController = StreamController<bool>();

  @override
  void initState() {
    Future<UsuarioModel?> future = UsuarioModel.get();
    future.then((UsuarioModel? usuarioModel) {
      if (usuarioModel != null) {
        push(context, HomePage(), replace: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

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
            StreamBuilder<bool>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  return AppButtom(
                    text: 'Login',
                    onPressed: () => _onClickLogin(context),
                    showProgess: snapshot.data ?? false,
                  );
                })
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
    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      // ignore: unused_local_variable
      UsuarioModel usuarioModel = response.result;
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg!);
    }
    _streamController.add(false);
  }
}
