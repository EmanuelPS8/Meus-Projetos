import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class PgMouse extends StatefulWidget {
  const PgMouse({super.key});

  @override
  State<PgMouse> createState() => _PgMouseState();
}

class _PgMouseState extends State<PgMouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util()
          .criaAppBar('Logitech G Mouse Gamer Sem Fio G305', 30, Colors.white),
      body: Container(
        child: Column(
          children: [
            Image.network(
              'https://m.media-amazon.com/images/I/51DYDLykzoL.__AC_SX300_SY300_QL70_ML2_.jpg',
              height: 200,
            ),
            const Text(
              'Marca: Logitech G',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Dispositivos compatíveis: PC',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Tecnologia de conexão: Sem fio',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Descrição do mouse: Jogos',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Características especiais: Portátil, Sem fio',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Cor: Branco',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Tecnologia de detecção de movimento: Óptico',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              '250 horas de duração da bateria',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Precisão de 400 IPS e a sensibilidade de até 12.000 DPI.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Valor: 277,77 reais',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
