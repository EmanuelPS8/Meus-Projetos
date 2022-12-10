import 'package:flutter/material.dart';

class Util {
  appBar(funcao) {
    return AppBar(
      title: const Text("Calculadora de IMC"),
      centerTitle: true,
      backgroundColor: Colors.red,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: funcao,
        )
      ],
    );
  }

  iconeGrande() {
    return const Icon(
      Icons.person_outline,
      size: 120.0,
      color: Color.fromARGB(255, 236, 127, 119),
    );
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador, msgValidacao) {
    return TextFormField(
      keyboardType: tipoTeclado,
      decoration: InputDecoration(
          labelText: textoEtiqueta,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 236, 127, 119),
          )),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromARGB(255, 236, 127, 119),
        fontSize: 25.0,
      ),
      controller: controlador,
      validator: (value) {
        if (value!.isEmpty) {
          return msgValidacao;
        }
      },
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 70,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  if (controladorFormulario.currentState!.validate()) {
                    funcao();
                  }
                },
                child: Text(
                  titulo,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 236, 127, 119),
                    fontSize: 30.0,
                  ),
                )),
          ),
        )
      ],
    );
  }

  criaTexto(texto, Color cor) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
