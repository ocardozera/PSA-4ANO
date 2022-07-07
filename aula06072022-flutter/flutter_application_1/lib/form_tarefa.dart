import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FormTarefa extends StatelessWidget {
  String? nome;
  String? descricao;

  salvar(BuildContext context, int? id, String? nome, String? descricao) async {
    var caminho = join(await getDatabasesPath(), 'banco.db');
    Database banco = await openDatabase(caminho);
    String sql;

    if (id == null) {
      sql = 'INSERT INTO tarefa (nome, descricao) VALUES (?, ?)';
      banco.rawInsert(sql, [nome, descricao]);
    } else {
      sql = 'UPDATE tarefa SET nome = ?, descricao = ? WHERE id = ?';
      banco.rawUpdate(sql, [nome, descricao, id]);
    }

    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de tarefa'),
        ),
        body: Form(
          child: Column(
            children: [
              TextField(
                onChanged: (nomeDigitado) {
                  nome = nomeDigitado;
                },
                decoration: const InputDecoration(
                    label: Text('Nome'), hintText: 'Digite o nome'),
              ),
              TextField(
                onChanged: (descricaoDigitada) {
                  descricao = descricaoDigitada;
                },
                decoration: const InputDecoration(
                    label: Text('Descrição'), hintText: 'Digite a descrição'),
              ),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  salvar(context, null, nome, descricao);
                },
              ),
            ],
          ),
        ));
  }
}
