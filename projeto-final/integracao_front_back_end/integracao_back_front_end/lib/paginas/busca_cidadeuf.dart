import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/util/componentes.dart';

class BuscaPorUf extends StatefulWidget {
  const BuscaPorUf({Key? key}) : super(key: key);

  @override
  State<BuscaPorUf> createState() => _BuscaPorUfState();
}

class _BuscaPorUfState extends State<BuscaPorUf> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtUF = TextEditingController();
  List<Cidade> lista = [];
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      if (txtUF.text == '') {
        List<Cidade> cidades = await AcessoApi().listaCidades();
        setState(() {
          lista = cidades;
        });
      } else {
        List<Cidade> cidades = await AcessoApi().cidadePorUf(txtUF.text);
        setState(() {
          lista = cidades;
        });
      }
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Busca Cidade por UF", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes().criaCaixaTexto(
                  "UF", TextInputType.text, txtUF, "Digite uma UF!!"),
              Componentes()
                  .criaBotao("Listar Cidades", listarTodas, formController),
              Expanded(
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, indice) {
                        return Card(
                          child: Componentes().criaItemCidade(lista[indice]),
                        );
                      }))
            ],
          )),
    );
  }
}
