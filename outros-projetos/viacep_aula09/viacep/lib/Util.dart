import 'package:flutter/material.dart';

class Util {
  criaAppBar(titulo, acao) {
    return AppBar(
      title: criaTexto(titulo),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: acao, icon: const Icon(Icons.refresh))
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

  criaContainerDados(rua, complemento, bairro, cidade, estado) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: criaTexto(rua, Colors.black)),
            Expanded(flex: 1, child: criaTexto(complemento, Colors.black)),
            Expanded(flex: 1, child: criaTexto(bairro, Colors.black)),
            Expanded(flex: 1, child: criaTexto(cidade, Colors.black)),
            Expanded(flex: 1, child: criaTexto(estado, Colors.black))
          ],
        ),
      ),
    );
  }

  criaIcone() {
    return const Icon(
      Icons.maps_home_work_outlined,
      size: 200,
      color: Colors.black,
    );
  }
}
