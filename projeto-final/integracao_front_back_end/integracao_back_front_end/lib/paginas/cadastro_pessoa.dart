import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';
import 'package:integracao_back_front_end/util/combo_cidade.dart';
import 'package:integracao_back_front_end/util/componentes.dart';
import 'package:integracao_back_front_end/util/radio_sexo.dart';

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
    final args = ModalRoute.of(context)?.settings.arguments as Pessoa;
    txtNome.text = args.nome;
    txtSexo.text = args.sexo;
    txtIdade.text = args.idade.toString();
    txtCidade.text = args.cidade.toString();

    cadastrar() async {
      Pessoa p = Pessoa(args.id, txtNome.text, txtSexo.text,
          int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      if (args.id == 0) {
        await AcessoApi().inserePessoa(p.toJson());
      } else {
        await AcessoApi().alteraCliente(p.toJson(), args.id);
      }
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Cadastro de Pessoa", home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes().criaCaixaTexto(
                  "Nome", TextInputType.text, txtNome, "Informe seu nome!!"),
              Componentes().criaCaixaTexto("Idade", TextInputType.number,
                  txtIdade, "Informe sua idade!!"),
              Center(child: RadioSexo(controller: txtSexo)),
              Center(child: ComboCidade(controller: txtCidade)),
              Componentes().criaBotao("Cadastrar", cadastrar, formController)
            ],
          )),
    );
  }
}
