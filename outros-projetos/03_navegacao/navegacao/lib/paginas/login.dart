import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navegacao/paginas/home.dart';
import 'package:navegacao/paginas/util.dart';

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
      if (txtEmail.text == 'emanuel' && txtSenha.text == '123') {
        Navigator.of(context).pushNamed('/home');
        print('SIM ${txtEmail.text} - ${txtSenha.text}');
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
                'Email', false, TextInputType.emailAddress, txtEmail),
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
