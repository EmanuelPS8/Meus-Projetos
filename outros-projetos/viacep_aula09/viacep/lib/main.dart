import 'package:flutter/material.dart';
import 'package:viacep/paginas/pg_principal.dart';
import 'package:viacep/tema.dart';

void main() {
  runApp(const ViaCep());
}

class ViaCep extends StatefulWidget {
  const ViaCep({super.key});

  @override
  State<ViaCep> createState() => _ViaCepState();
}

class _ViaCepState extends State<ViaCep> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      home: const PgPrincipal(),
    );
  }
}
