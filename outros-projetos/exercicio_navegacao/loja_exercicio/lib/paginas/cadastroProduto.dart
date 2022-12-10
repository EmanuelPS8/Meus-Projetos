import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class cadastroProduto extends StatefulWidget {
  const cadastroProduto({super.key});

  @override
  State<cadastroProduto> createState() => _cadastroProdutoState();
}

class _cadastroProdutoState extends State<cadastroProduto> {
  TextEditingController txtNomeProduto = TextEditingController();
  TextEditingController txtValorProduto = TextEditingController();
  TextEditingController txtDescricaoProduto = TextEditingController();
  TextEditingController txtImagemProduto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    cadastraProduto() {}

    return Scaffold(
      appBar: Util().criaAppBar('Cadastro de Produtos', 20, Colors.white),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Util().criaTextField(
                'Nome do Produto', false, TextInputType.none, txtNomeProduto),
            Util().criaTextField('Descricao do Produto', false,
                TextInputType.none, txtDescricaoProduto),
            Util().criaTextField(
                'Valor do Produto', false, TextInputType.none, txtValorProduto),
            Util().criaTextField('Imagem do Produto', false, TextInputType.none,
                txtImagemProduto),
            Util().criaBotao('Cadastrar Produto', cadastraProduto, 50, 200)
          ],
        ),
      ),
    );
  }
}
