//tudo que vemos numa tela em flutter é widget

//gerenciamento de estado: atualizacao automatica da tela

//stateful - reconhece automaticamente as atualizacoes da tela
//stateless - nao reconhece automaticamente as atualizacoes da tela

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Widget criarBotao(String rotulo, VoidCallback? acao) {
    return ElevatedButton(
      child: Text(rotulo),
      onPressed: acao,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          criarBotao(
              'Contador', () => Navigator.pushNamed(context, '/contador')),
          criarBotao(
              'Hello World', () => Navigator.pushNamed(context, '/helloworld')),
          criarBotao('Calcular idade',
              () => Navigator.pushNamed(context, '/calcularIdade')),
          criarBotao('Calculadora',
              () => Navigator.pushNamed(context, '/calculadora')),
        ],
      )),
    );
  }
}
