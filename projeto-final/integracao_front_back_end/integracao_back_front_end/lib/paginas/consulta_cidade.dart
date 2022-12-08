import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/util/componentes.dart';

class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({Key? key}) : super(key: key);

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cidade> lista = [];
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarCidades() async {
      List<Cidade> cidades = await AcessoApi().listaCidades();
      setState(() {
        lista = cidades;
      });
    }

    criaItemCidade(Cidade c, context) {
      return ListTile(
        title: Text("${c.id} - ${c.nome} - ${c.uf}"),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cadastrocidade",
                      arguments: c,
                    );
                  }),
              IconButton(
                  onPressed: () async {
                    await AcessoApi().deleteCidade(c.id);
                    setState(() {
                      listarCidades();
                    });
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Consulta de Cidades", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes()
                  .criaBotao("Listar Cidades", listarCidades, formController),
              Expanded(
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, indice) {
                        return Card(
                          elevation: 6,
                          margin: const EdgeInsets.all(5),
                          child: criaItemCidade(lista[indice], context),
                        );
                      }))
            ],
          )),
    );
  }
}
