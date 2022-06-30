import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  String? nomePessoa;
  String? anoNascimentoInput;

  dialog(String mensagem, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
    );
  }
}
