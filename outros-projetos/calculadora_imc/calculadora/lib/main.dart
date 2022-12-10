import 'package:calculadora/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String msg = "";

  limparCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      msg = "Informe os seus dados!!";
      formController = GlobalKey<FormState>();
    });
  }

  calcularImc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / (altura * altura);
      String imcText = imc.toStringAsPrecision(4);
      if (imc < 18.6) {
        msg = "Abaixo do peso ($imcText)";
      } else if (imc > 18.6 && imc < 24.9) {
        msg = "Peso ideal($imcText)";
      } else {
        msg = "Obesidade ($imcText)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: paginaPrincipal());
  }

  paginaPrincipal() {
    return Scaffold(
      appBar: Util().appBar(limparCampos),
      body: Form(
        key: formController,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Util().iconeGrande(),
            Util().criaInputTexto(TextInputType.number, 'Peso(Kg)',
                pesoController, 'Informe o seu peso'),
            Util().criaInputTexto(TextInputType.number, 'Altura',
                alturaController, 'Informe o sua altura'),
            Util().criaBotao(formController, calcularImc, 'Calcular'),
            Util().criaTexto(msg, Color.fromARGB(255, 236, 127, 119)),
          ],
        ),
      ),
    );
  }
}
