import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:viacep/Util.dart';

class PgPrincipal extends StatefulWidget {
  const PgPrincipal({super.key});

  @override
  State<PgPrincipal> createState() => _PgPrincipalState();
}

class _PgPrincipalState extends State<PgPrincipal> {
  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String rua = 'rua:';
  String complemento = 'complemento:';
  String bairro = 'bairro:';
  String cidade = 'cidade:';
  String estado = 'estado:';

  limparTela() {
    setState(() {
      rua = "Rua:";
      complemento = "Complemento:";
      bairro = "Bairro";
      cidade = "Cidade:";
      estado = "Estado:";
      cepController.text = "";
      formController = GlobalKey<FormState>();
    });
  }

  buscarEndereco() async {
    String url = "https://viacep.com.br/ws/${cepController.text}/json/";
    Response resposta = await get(Uri.parse(url));
    Map endereco = json.decode(resposta.body);
    print(endereco);
    setState(() {
      rua = "Rua: ${endereco['logradouro']}";
      complemento = "Complemento: ${endereco['complemento']}";
      bairro = "Bairro: ${endereco['bairro']}";
      cidade = "Cidade: ${endereco['localidade']}";
      estado = "Estado: ${endereco['uf']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util().criaAppBar('Viacep', limparTela),
      body: Form(
        key: formController,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Util().criaIcone(),
            Util().criaCaixaTexto(
                'CEP', TextInputType.number, cepController, 'Informe seu CEP'),
            Util().criaBotao('Buscar Endereco', buscarEndereco, formController),
            Util().criaContainerDados(rua, complemento, bairro, cidade, estado)
          ],
        ),
      ),
    );
  }
}
