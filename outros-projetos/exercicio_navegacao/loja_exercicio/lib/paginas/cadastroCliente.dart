import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class cadClientePage extends StatefulWidget {
  const cadClientePage({super.key});

  @override
  State<cadClientePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<cadClientePage> {
  TextEditingController txtNomeCliente = TextEditingController();
  TextEditingController txtEmailCliente = TextEditingController();
  TextEditingController txtSenhaCliente = TextEditingController();

  cadastrarProduto() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util().criaAppBar('Cadastro de Cliente', 20, Colors.white),
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Util().criaTextField(
              'Nome Cliente', false, TextInputType.none, txtNomeCliente),
          Util().criaTextField('E-mail Cliente', false,
              TextInputType.emailAddress, txtEmailCliente),
          Util().criaTextField(
              'Senha', true, TextInputType.none, txtSenhaCliente),
          Util().criaBotao('Cadastrar Cliente', cadastrarProduto, 50, 200)
        ]),
      ),
    );
  }
}
