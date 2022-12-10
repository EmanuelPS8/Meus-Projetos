import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';
import 'package:integracao_back_front_end/util/combo_cidade.dart';
import 'package:integracao_back_front_end/util/componentes.dart';

class ClientePorCidade extends StatefulWidget {
  const ClientePorCidade({super.key});

  @override
  State<ClientePorCidade> createState() => _ClientePorCidadeState();
}

class _ClientePorCidadeState extends State<ClientePorCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    listarTodas() async {
      if (txtCidade.text == '') {
        List<Pessoa> pessoas = await AcessoApi().listaPessoas();
        setState(() {
          lista = pessoas;
        });
      } else {
        List<Pessoa> pessoas =
            await AcessoApi().buscaPessoaFiltro(int.parse(txtCidade.text));
        setState(() {
          lista = pessoas;
        });
      }
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Busca Pessoa por Cidade", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Center(
                child: ComboCidade(
                  controller: txtCidade,
                ),
              ),
              Componentes().criaBotao("Pesquisar", listarTodas, formController),
              Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Componentes().criaItemPessoa(
                        lista[index],
                      ));
                },
              ))
            ],
          )),
    );
  }
}
