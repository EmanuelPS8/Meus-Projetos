import 'package:api_teste/api/acesso_api.dart';
import 'package:api_teste/model/pessoa.dart';
import 'package:api_teste/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home(){
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoa();
      setState(() {
        lista = pessoas;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Utilizaçao API', 40, Colors.red, home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao('listar todas', listarTodas, 40, double.infinity, formController),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) { 
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Componentes().criaItemPessoa(lista[indice]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}