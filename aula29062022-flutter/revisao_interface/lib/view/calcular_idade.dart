import 'package:flutter/material.dart';

class CalcularIdade extends StatelessWidget {
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
        title: const Text('Calcular idade'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              onChanged: (valorDigitado) {
                nomePessoa = valorDigitado;
              },
              decoration: const InputDecoration(
                  label: Text('Nome'), hintText: 'Digite seu nome completo'),
            ),
            TextField(
              onChanged: (valorDigitado) {
                anoNascimentoInput = valorDigitado;
              },
              decoration: const InputDecoration(
                  label: Text('Ano de nascimento'),
                  hintText: 'Digite o ano de nascimento'),
            ),
            ElevatedButton(
              child: const Text('CALCULAR'),
              onPressed: () {
                bool camposNaoPreenchidos =
                    camposNaoEstaoPreenchidos(nomePessoa, anoNascimentoInput);

                if (camposNaoPreenchidos) {
                  dialog('Preencha os campos obrigatórios!', context);
                } else {
                  int anoNascimento = int.parse(anoNascimentoInput!);

                  int idade = calcularIdade(anoNascimento);
                  dialog('$nomePessoa - $idade anos', context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool camposNaoEstaoPreenchidos(
      String? nomePessoa, String? anoNascimentoInput) {
    if (nomePessoa == "" ||
        nomePessoa == null ||
        anoNascimentoInput == "" ||
        anoNascimentoInput == null) {
      return true;
    } else {
      return false;
    }
  }

  int calcularIdade(int anoNascimento) {
    if (anoNascimento > 0) {
      int anoAtual = DateTime.now().year;
      int idade = anoAtual - anoNascimento;
      return idade;
    } else {
      throw Exception();
    }
  }
}
