import 'dart:js';

import 'package:flutter/material.dart';
import 'package:loja_exercicio/paginas/admin.dart';
import 'package:loja_exercicio/paginas/cadastroCliente.dart';
import 'package:loja_exercicio/paginas/cadastroProduto.dart';
import 'package:loja_exercicio/paginas/cliente.dart';
import 'package:loja_exercicio/paginas/login.dart';
import 'package:loja_exercicio/paginas/pgHeadset.dart';
import 'package:loja_exercicio/paginas/pgMouse.dart';
import 'package:loja_exercicio/paginas/pgTeclado.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/admin': (context) => adminPage(),
        '/cliente': (context) => clientePage(),
        '/cadastroCliente': (context) => cadClientePage(),
        '/cadastroProduto': (context) => cadastroProduto(),
        '/pgHeadset': (context) => PgHeadset(),
        '/pgMouse': (context) => PgMouse(),
        '/pgTeclado': (context) => PgTeclado(),
      },
    );
  }
}
