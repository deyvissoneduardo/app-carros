import 'package:app_carros/data/api_response.dart';
import 'package:app_carros/data/login_api.dart';
import 'package:app_carros/models/usuario_model.dart';
import 'package:app_carros/pages/home_page.dart';
import 'package:app_carros/pages/widgets/app_buttom.dart';
import 'package:app_carros/pages/widgets/app_text.dart';
import 'package:app_carros/utils/alert.dart';
import 'package:app_carros/utils/navigator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.context}) : super(key: key);
  final _tLogin = TextEditingController(text: 'user');
  final _tSenha = TextEditingController(text: '123');
  final _formKey = GlobalKey<FormState>();
  BuildContext? context;
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
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AppText(
                label: 'Login',
                hint: 'email',
                obscureText: false,
                controller: _tLogin,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo Invalido';
                  return null;
                }),
            const SizedBox(height: 10),
            AppText(
              label: 'Senha',
              hint: '123',
              obscureText: true,
              controller: _tSenha,
              validator: (value) {
                if (value!.isEmpty) return 'Campo Invalido';
                return null;
              },
            ),
            const SizedBox(height: 10),
            AppButtom(
              text: 'Login',
              onPressed: () => _onClickLogin(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogin(context) async {
    bool formOk = _formKey.currentState!.validate();
    if (!formOk) return;
    String login = _tLogin.text;
    String senha = _tSenha.text;
    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      // ignore: unused_local_variable
      UsuarioModel usuarioModel = response.result;
      push(context, HomePage());
    } else {
      alert(context, response.msg!);
    }
  }
}
