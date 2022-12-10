import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class PgTeclado extends StatefulWidget {
  const PgTeclado({super.key});

  @override
  State<PgTeclado> createState() => _PgTecladoState();
}

class _PgTecladoState extends State<PgTeclado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util().criaAppBar(
          'Teclado Mecânico Gamer Sem Fio Logitech G915 TKL', 30, Colors.white),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
              'https://m.media-amazon.com/images/I/71hEfSk5pQL._AC_SL1500_.jpg',
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
              'Tecnologia de conexão: Bluetooth, Usb',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Descrição do teclado: Jogos',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Características especiais: Bluetooth, Sem fio, Mecânico',
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
              'Switches mecânicos GL Tactile de baixo perfil',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              '40 horas de duração da bateria',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Valor: 1.215,40 reais',
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
