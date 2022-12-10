import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';

class ComboCidade extends StatefulWidget {
  TextEditingController? controller;

  ComboCidade({Key? key, this.controller}) : super(key: key);

  @override
  State<ComboCidade> createState() => _ComboCidadeState();
}

class _ComboCidadeState extends State<ComboCidade> {
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();
  int? cidadesel;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Pessoa;

    txtNome.text = args.nome;
    txtIdade.text = args.idade.toString();
    txtSexo.text = args.sexo.toString();
    txtCidade.text = args.cidade.id.toString();

    if (args.cidade.id == 0) {
      cidadesel;
    } else {
      cidadesel = args.cidade.id;
    }
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => AcessoApi().listaCidades()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<Cidade> cidades = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: DropdownButton(
                isExpanded: true,
                value: cidadesel,
                icon: const Icon(Icons.arrow_downward),
                hint: const Text('Selecione uma cidade...'),
                elevation: 16,
                onChanged: (int? value) {
                  setState(() {
                    cidadesel = value;
                    widget.controller?.text = "$value";
                  });
                },
                items: cidades.map<DropdownMenuItem<int>>((Cidade cid) {
                  return DropdownMenuItem<int>(
                      value: cid.id, child: Text("${cid.nome}/${cid.uf}"));
                }).toList(),
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Carregando Cidades'),
              ],
            );
          }
        });
  }
}
