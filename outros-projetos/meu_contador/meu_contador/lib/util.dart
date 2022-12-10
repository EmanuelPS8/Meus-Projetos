import 'package:flutter/material.dart';

class util {
  configuraFundo() {
    return const BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/imgs/pub.jpg'),
      fit: BoxFit.cover,
    ));
  }

  criaTexto(conteudo, tamanho, cor) {
    return Text(
      conteudo,
      style:
          TextStyle(fontSize: tamanho, color: cor, fontWeight: FontWeight.w500),
    );
  }

  criaBotao(conteudoTexto, tamanhoTexto, corTexto, acaoBotao, corFundoBotao) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: corFundoBotao,
            fixedSize: Size(100, 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        onPressed: acaoBotao,
        child: criaTexto(conteudoTexto, tamanhoTexto, corTexto));
  }
}
