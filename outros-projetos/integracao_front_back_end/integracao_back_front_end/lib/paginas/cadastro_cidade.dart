import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/paginas/home.dart';
import 'package:integracao_back_front_end/util/componentes.dart';

class CadastroCidade extends StatefulWidget {
  const CadastroCidade({super.key});

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cidade;
    txtNome.text = args.nome;
    txtUf.text = args.uf;

    cadastrarCidade() async {
      Cidade c = Cidade(args.id, txtNome.text, txtUf.text);
      if (args.id == 0) {
        await AcessoApi().insereCidade(c.toJson());
      } else {
        await AcessoApi().alteraCidade(c.toJson(), args.id);
      }
      Navigator.of(context).pushReplacementNamed('/consultacidade');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Cadastro de Cidade', home),
      body: Form(
          key: formController,
          child: Column(
            children: [
              Componentes().criaCaixaTexto("Nome Cidade", TextInputType.text,
                  txtNome, "Informe sua cidade!"),
              Componentes().criaCaixaTexto("Seu estado", TextInputType.text,
                  txtUf, "Informe seu estado!"),
              Componentes()
                  .criaBotao("Cadastrar", cadastrarCidade, formController)
            ],
          )),
    );
  }
}
