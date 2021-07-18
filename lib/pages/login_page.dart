import 'package:app_carros/pages/widgets/app_buttom.dart';
import 'package:app_carros/pages/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  _body() {
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
            ),
            const SizedBox(height: 10),
            AppButtom(
              text: 'Login',
              onPressed: _onClickLogin,
            )
          ],
        ),
      ),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState!.validate();
    if (!formOk) return;
  }
}
