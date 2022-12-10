import 'package:api_teste/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> formController =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    home(){
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro(){
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta(){
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Utilizaçao API', 40, Colors.red, home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao('Cadastro pessoa', cadastro, 30, double.infinity, formController),
            Componentes().criaBotao('Consulta pessoa', consulta, 30, double.infinity, formController),
          ],
        ),
      ),
    );
  }
}