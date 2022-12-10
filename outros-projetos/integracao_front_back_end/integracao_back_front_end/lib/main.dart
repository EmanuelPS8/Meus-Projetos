import 'package:flutter/material.dart';
import 'package:integracao_back_front_end/paginas/busca_cidadeuf.dart';
import 'package:integracao_back_front_end/paginas/busca_clienteporcidade.dart';
import 'package:integracao_back_front_end/paginas/cadastro_cidade.dart';
import 'package:integracao_back_front_end/paginas/cadastro_pessoa.dart';
import 'package:integracao_back_front_end/paginas/consulta_cidade.dart';
import 'package:integracao_back_front_end/paginas/consulta_pessoa.dart';
import 'package:integracao_back_front_end/paginas/home.dart';
import 'package:integracao_back_front_end/util/tema.dart';

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
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/consulta': (context) => const Consulta(),
        '/cadastro': (context) => const Cadastro(),
        '/cadastrocidade': (context) => const CadastroCidade(),
        '/consultacidade': (context) => const ConsultaCidade(),
        '/buscaporuf': (context) => const BuscaPorUf(),
        '/buscaclienteporcidade': (context) => const ClientePorCidade(),
      },
    );
  }
}
