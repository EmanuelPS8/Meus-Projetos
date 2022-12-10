import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                criaContainerConteudo(Colors.grey),
                criaContainerConteudo(Colors.grey),
                criaContainerConteudo(Colors.grey),
              ]),
            )),
        Expanded(flex: 8, child: criaContainer(Colors.white)),
        Expanded(flex: 1, child: criaContainer(Colors.blue)),
      ]),
    );
  }
}

criaContainer(Color cor) {
  return Container(
    color: cor,
  );
}

criaContainerConteudo(Color cor) {
  return Container(
    height: 100,
    width: 100,
    color: cor,
  );
}
