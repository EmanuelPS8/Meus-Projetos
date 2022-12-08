import 'package:flutter/material.dart';
import 'package:integracao_back_front_end/api/acesso_api.dart';
import 'package:integracao_back_front_end/model/cidade.dart';
import 'package:integracao_back_front_end/model/pessoa.dart';

class Componentes {
  criaAppBar(titulo, acao) {
    return AppBar(
      title: criaTexto(titulo),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: acao, icon: const Icon(Icons.home))
      ],
    );
  }

  criaTexto(conteudo, [cor]) {
    if (cor != null) {
      return Text(
        conteudo,
        style: TextStyle(color: cor),
      );
    }
    return Text(conteudo);
  }

  criaCaixaTexto(titulo, tipoTeclado, controlador, msgValidacao) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextFormField(
        controller: controlador,
        keyboardType: tipoTeclado,
        validator: (value) {
          if (value!.isEmpty) {
            return msgValidacao;
          }
        },
        decoration: InputDecoration(
          labelText: titulo,
          labelStyle: const TextStyle(fontSize: 20),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  criaBotao(rotulo, funcao, controladorFormulario) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (controladorFormulario.currentState!.validate()) {
                      funcao();
                    }
                  },
                  child: Text(
                    rotulo,
                    style: const TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                )))
      ],
    );
  }

  criaIcone() {
    return const Icon(
      Icons.maps_home_work_outlined,
      size: 200,
      color: Colors.black,
    );
  }

  criaItemPessoa(Pessoa p) {
    String sexo = p.sexo == 'M' ? "Masculino" : "Feminino";
    return ListTile(
      title: criaTexto("${p.id} - ${p.nome}"),
      subtitle: criaTexto(
          "${p.idade} anos - ${sexo} - ${p.cidade.nome}/${p.cidade.uf}"),
      trailing: Column(children: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            await AcessoApi().deletePessoa(p.id);
          },
        ),
      ]),
    );
  }

  criaItemCidade(Cidade c) {
    return ListTile(
      title: criaTexto("${c.id} - ${c.nome} - ${c.uf}"),
    );
  }
}
