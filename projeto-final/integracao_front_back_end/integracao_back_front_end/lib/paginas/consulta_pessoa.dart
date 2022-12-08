import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';
import 'package:integracao_back_front_end/util/componentes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
    }

    @override
    void initState() {
      super.initState();
      AcessoApi().listaPessoas();
    }

    criaItemPessoa(Pessoa p, context) {
      return ListTile(
        title: Text('${p.id} - ${p.nome}'),
        subtitle: Text(
            "${p.idade} anos - ${p.sexo} - ${p.cidade.nome}/${p.cidade.uf}"),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cadastro",
                      arguments: p,
                    );
                  }),
              IconButton(
                  onPressed: () async {
                    await AcessoApi().deletePessoa(p.id);
                    setState(() {
                      listarTodas();
                    });
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de Pessoa", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao("Listar Todas", listarTodas, formController),
            Expanded(
              child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: criaItemPessoa(lista[index], context),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
