import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  String? nome;

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
        title: const Text('Hello World'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              onChanged: (valorDigitado) {
                nome = valorDigitado;
              },
              decoration: const InputDecoration(
                  label: Text('Nome'), hintText: 'Digite seu nome completo'),
            ),
            ElevatedButton(
              child: Text('OK'),
              onPressed: () => dialog('Hello World - $nome', context),
            )
          ],
        ),
      ),
    );
  }
}
