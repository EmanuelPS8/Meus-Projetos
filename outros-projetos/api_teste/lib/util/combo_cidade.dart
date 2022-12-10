import 'package:api_teste/api/acesso_api.dart';
import 'package:api_teste/model/cidade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComboCidade extends StatefulWidget {
  TextEditingController? controller;

  ComboCidade({super.key, this.controller});

  @override
  State<ComboCidade> createState() => _ComboCidadeState();
}

class _ComboCidadeState extends State<ComboCidade> {
  int? cidadesel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)).then((value) => AcessoApi().listaCidade()),
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData && snapshot.data !=  null){
          List<Cidade> cidades = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              isExpanded: true,
              value: cidadesel,
              icon: const Icon(Icons.arrow_downward),
              hint: const Text('Selecione uma cidade...'),
              elevation: 16,
              onChanged: (int? value){
                setState(() {
                  cidadesel = value;
                  widget.controller?.text = "$value";
                });
              },
              items: cidades.map<DropdownMenuItem<int>>((Cidade cid){
                return DropdownMenuItem<int>(value: cid.id, child: Text("${cid.nome}/${cid.uf}"));
              }).toList(),
            ),
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Carregando Cidades'),
            ],
          );
        }
      },
    );
  }
}