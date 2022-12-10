import 'package:api_teste/model/pessoa.dart';
import 'package:flutter/material.dart';

class Componentes{
  
  criaAppBar(titulo, tamnaho, cor, funcao){
    return AppBar(
      title: criaTexto('Utilização API', 30, Colors.white),
      actions:<Widget> [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: funcao,
        )
      ],
      centerTitle: true,
      backgroundColor: cor,
    );
  }

  criaTexto(conteudo, tamanho, cor){
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tamanho,
        color: cor,
      ),
    );
  }

  criaTextField(titulo, senha, tipoTeclado, controlador, msgValidacao){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        keyboardType: tipoTeclado,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: titulo,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
              fontSize: 20,
          ),
        ),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 20),
        controller: controlador,
        validator: (value) {
          if(value!.isEmpty){
            return msgValidacao;
          }
        }
      ),
    );
  }

  criaBotao(titulo, funcao, altura, largura, controller,){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,10,5),
      child: SizedBox(
      height: altura,
      width: largura,
      child: ElevatedButton(
        onPressed: funcao,
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
        ),
        child: criaTexto(titulo, 20, Colors.black),
      ),
    ),
    );
  }

  criaItemPessoa(Pessoa p){
    String sexo = p.sexo == 'M' ? "Masculino" : "Feminino";
    return ListTile(
      title: criaTexto("${p.id} - ${p.nome}", 20, Colors.white),
      subtitle:  criaTexto("${p.idade} anos - (${p.sexo})", 20, Colors.white),
      trailing: criaTexto("${p.cidade.nome}/${p.cidade.uf}", 20, Colors.white),
    );
  }

}