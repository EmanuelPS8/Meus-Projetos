import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util {
  criaTexto(conteudo, [cor]) {
    return Text(
      conteudo,
      style: TextStyle(color: cor),
    );
  }

  criaAppBar(titulo, acao) {
    return AppBar(
      title: criaTexto(titulo),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: acao, icon: const Icon(Icons.refresh))
      ],
    );
  }

  criaTextField(titulo, tipoTeclado, msgValidacao, controlador) {
    return SizedBox(
      width: 300,
      height: 50,
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
            labelStyle: const TextStyle(fontSize: 25),
            border: const OutlineInputBorder()),
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
                  style: const TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }

  criaContainerDados(valorReal, valorDolar, valorEuro) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 400,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: criaTexto(valorReal, Colors.yellow)),
            Expanded(flex: 1, child: criaTexto(valorDolar, Colors.green)),
            Expanded(flex: 1, child: criaTexto(valorEuro, Colors.blue)),
          ],
        ),
      ),
    );
  }
}
