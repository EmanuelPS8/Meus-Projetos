import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fazLogin() {
      if (txtEmail.text == 'cliente' && txtSenha.text == '123') {
        Navigator.of(context).pushReplacementNamed('/cliente');
        print('SIM ${txtEmail.text} - ${txtSenha.text}');
      } else if (txtEmail.text == 'admin' && txtSenha.text == 'admin') {
        Navigator.of(context).pushReplacementNamed('/admin');
        print('SIM ADMIN ${txtEmail.text} - ${txtSenha.text}');
      } else {
        print('NAO ${txtEmail.text} - ${txtSenha.text}');
      }
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Util().criaTextField(
                'Login', false, TextInputType.emailAddress, txtEmail),
            Util().criaTextField('Senha', true, TextInputType.none, txtSenha),
            const SizedBox(
              height: 30,
            ),
            Util().criaBotao('Entrar', fazLogin, 50, 200)
          ],
        ),
      ),
    );
  }
}
