import 'package:api_teste/api/acesso_api.dart';
import 'package:api_teste/model/cidade.dart';
import 'package:api_teste/model/pessoa.dart';
import 'package:api_teste/util/combo_cidade.dart';
import 'package:api_teste/util/componentes.dart';
import 'package:api_teste/util/radio_sexo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    cadastrar(){
      Pessoa p = Pessoa(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "",""));
      AcessoApi().inserePessoa(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta');
    }
    home(){
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Cadastro pessoa', 40, Colors.red, home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaTextField("Nome", false, TextInputType.text, txtNome, "informe o nome"),
            Componentes().criaTextField("Idade", false, TextInputType.number, txtIdade, "informe a idade"),
            Center(child: RadioSexo(controller:  txtSexo)),
            Center(child: ComboCidade(controller:  txtCidade)),
            Componentes().criaBotao("Cadastrar", cadastrar, 50, double.infinity, formController),
          ],
        ),
      ),
    );
  }
}