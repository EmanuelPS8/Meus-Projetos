import 'package:financas/paginas/pg_principal.dart';
import 'package:financas/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Financas());
}

class Financas extends StatefulWidget {
  const Financas({super.key});

  @override
  State<Financas> createState() => _FinancasState();
}

class _FinancasState extends State<Financas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      home: const PrincipalPage(),
    );
  }
}
