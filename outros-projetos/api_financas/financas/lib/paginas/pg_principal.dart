import 'dart:io';

import 'package:financas/util/componentes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  TextEditingController moedaController = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  limparTela() {
    print('Limpar tela');
  }

  converterMoeda() async {
    String url =
        "https://api.hgbrasil.com/finance?format=json-cors&key=b2e57b41";
  }

  escolherDolar() {}

  escolherEuro() {
    print('Euro');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util().criaAppBar('Conversor', limparTela),
      body: Form(
          key: formController,
          child: Column(
            children: [
              const SizedBox(
                width: 100,
                height: 100,
              ),
              Util().criaTexto('Moeda que deseja converter', Colors.white),
              const SizedBox(
                height: 10,
              ),
              Util().criaBotao('Dolar', escolherDolar(), moedaController),
              Util().criaBotao('Euro', escolherEuro(), moedaController),
              Util().criaTextField('Valor moeda estrangeira',
                  TextInputType.number, 'Digite um valor', moedaController),
              const SizedBox(
                width: 100,
                height: 20,
              ),
              Util().criaTexto('Valor em real', Colors.white),
              const SizedBox(
                height: 10,
              ),
              Util().criaBotao('Converter', converterMoeda, formController)
            ],
          )),
    );
  }
}
