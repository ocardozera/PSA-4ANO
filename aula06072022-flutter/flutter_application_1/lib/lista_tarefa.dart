import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatelessWidget {
  Future<List<Map<String, Object?>>> buscarDados() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, Object?>> tarefas = [
      {'nome': 'Projeto', 'descricao': 'Projeto WEB'},
      {'nome': 'Apresentação', 'descricao': 'Apresentação Grupo'}
    ];

    return tarefas;
  }

  Future<List<Map<String, Object?>>> buscarDadosBanco() async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.db');
    Database banco =
        await openDatabase(caminhoBD, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE tarefa(
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          descricao TEXT NOT NULL
        )
      ''');
      db.execute(
          'INSERT INTO tarefa (nome, descricao) VALUES ("Prova", "Prova na Segunda")');
      db.execute(
          'INSERT INTO tarefa (nome, descricao) VALUES ("Seminário", "Governança")');
    });

    List<Map<String, Object?>> tarefas = await banco.query('tarefa');

    return tarefas;
  }

  @override
  Widget build(BuildContext context) {
    buscarDados();
    print('1');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/formTarefa'),
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: buscarDadosBanco(),
        builder:
            (context, AsyncSnapshot<List<Map<String, Object?>>> dadosFuturos) {
          if (!dadosFuturos.hasData) {
            return CircularProgressIndicator();
          } else {
            var tarefas = dadosFuturos.data!;
            return ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, contador) {
                  var tarefa = tarefas[contador];
                  return ListTile(
                    title: Text(tarefa['nome'].toString()),
                    subtitle: Text(tarefa['descricao'].toString()),
                  );
                });
          }
        },
      ),
    );
  }
}
