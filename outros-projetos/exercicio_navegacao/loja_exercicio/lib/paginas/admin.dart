import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/cadastroProduto.dart';
import 'package:loja_exercicio/paginas/util.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  telaProduto() {
    Navigator.of(context).pushNamed('/cadastroProduto');
  }

  telaCliente() {
    Navigator.of(context).pushNamed('/cadastroCliente');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util().criaAppBar('Menu Admin', 40, Colors.white),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Util().iconeProduto(),
                Util().criaBotao('Cadastrar Produto', telaProduto, 100, 400)
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Util().iconeCliente(),
                Util().criaBotao('Cadastrar Cliente', telaCliente, 100, 400)
              ],
            )
          ],
        ),
      ),
    );
  }
}
