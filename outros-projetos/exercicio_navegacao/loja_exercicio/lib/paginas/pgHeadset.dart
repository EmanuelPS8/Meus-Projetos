import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loja_exercicio/paginas/util.dart';

class PgHeadset extends StatefulWidget {
  const PgHeadset({super.key});

  @override
  State<PgHeadset> createState() => _PgHeadsetState();
}

class _PgHeadsetState extends State<PgHeadset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util()
          .criaAppBar('Headset Sem Fio ASTRO Gaming A50', 30, Colors.white),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
                'https://m.media-amazon.com/images/I/71Pfow1d1-L.__AC_SX300_SY300_QL70_ML2_.jpg'),
            const Text(
              'Marca: Astro',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Dispositivos compatíveis: PC, PS4, Mac',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Tecnologia de conexão: Base Station Gen 4',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Microfone de 6 mm com funcionalidade flip-to-mute',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Características especiais: MixAmp integrado',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Cor: Preto/Prata',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'ASTRO Audio V2 e Dolby Audio integrado',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              '15 horas de duração da bateria',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Valor: 1.999,00 reais',
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
