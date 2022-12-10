import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

import 'util.dart';

class clientePage extends StatefulWidget {
  const clientePage({super.key});

  @override
  State<clientePage> createState() => _clientePageState();
}

class _clientePageState extends State<clientePage> {
  pgMouse() {
    Navigator.of(context).pushNamed('/pgMouse');
  }

  pgTeclado() {
    Navigator.of(context).pushNamed('/pgTeclado');
  }

  pgHeadset() {
    Navigator.of(context).pushNamed('/pgHeadset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Util().criaAppBar('Produtos', 40, Colors.white),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.network(
                    'https://m.media-amazon.com/images/I/51DYDLykzoL.__AC_SX300_SY300_QL70_ML2_.jpg',
                  ),
                  const Text(
                    'Logitech G Mouse Gamer Sem Fio G305  - 277,77 reais',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Util().criaBotao('Mais Informações', pgMouse, 50, 200),
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Column(
                children: [
                  Image.network(
                    'https://m.media-amazon.com/images/I/71hEfSk5pQL._AC_SL1500_.jpg',
                    height: 300,
                    width: 300,
                  ),
                  const Text(
                    'Teclado Mecânico Gamer Sem Fio Logitech G915 TKL - 1.215,40 reais',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Util().criaBotao('Mais Informações', pgTeclado, 50, 200),
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Column(
                children: [
                  Image.network(
                      'https://m.media-amazon.com/images/I/71Pfow1d1-L.__AC_SX300_SY300_QL70_ML2_.jpg'),
                  const Text(
                    'Headset Sem Fio ASTRO Gaming A50 - 1.999,00 reais',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Util().criaBotao('Mais Informações', pgHeadset, 50, 200),
                ],
              )
            ],
          ),
        ));
  }
}
