import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';
import 'package:integracao_back_front_end/paginas/cadastro_pessoa.dart';
import 'package:integracao_back_front_end/util/componentes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro',
          arguments: Pessoa(0, "", "M", 0, Cidade(0, "", "")));
    }

    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta',
          arguments: Pessoa(0, "", "M", 0, Cidade(0, "", "")));
    }

    cadastroCidade() {
      Navigator.of(context).pushReplacementNamed('/cadastrocidade',
          arguments: Cidade(0, '', ''));
    }

    consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consultacidade');
    }

    pesquisaCidadePorUf() {
      Navigator.of(context).pushReplacementNamed('/buscaporuf');
    }

    clientePorCidade() {
      Navigator.of(context).pushReplacementNamed('/buscaclienteporcidade',
          arguments: Pessoa(0, "", "M", 0, Cidade(0, "", "")));
    }

    return Scaffold(
      appBar: Componentes().criaAppBar(
        "Utilização de API",
        home,
      ),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes()
                  .criaBotao("Cadastro Pessoa", cadastro, formController),
              Componentes()
                  .criaBotao("Consulta Pessoa", consulta, formController),
              Componentes()
                  .criaBotao("Cadastro Cidade", cadastroCidade, formController),
              Componentes()
                  .criaBotao("Consulta Cidade", consultaCidade, formController),
              Componentes().criaBotao(
                  "Busca Cidade por UF", pesquisaCidadePorUf, formController),
              Componentes().criaBotao(
                  "Busca Cliente por Cidade", clientePorCidade, formController)
            ],
          )),
    );
  }
}
