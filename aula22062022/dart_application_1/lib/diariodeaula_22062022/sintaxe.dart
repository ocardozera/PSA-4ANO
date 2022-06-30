import 'dart:io';

main() {
  var estado = Estado(nome: "Paraná", sigla: "PR");
  var cidade = Cidade(nome: "Paranavaí", estado: estado);

  var aluno = Aluno(
      registroAcademico: 31,
      nome: "Igor",
      numero: 18,
      valido: true,
      cidade: cidade);

  print(aluno.nome);
  print(aluno.numero);
  print(aluno.cidade.nome);
}

class Pessoa {
  final String nome;
  final int numero;
  final bool valido;
  final Cidade cidade;

  Pessoa(
      {required this.nome,
      required this.numero,
      required this.valido,
      required this.cidade});
}

//arrumar, criar objeto, inserir valores e imprimir

class Aluno extends Pessoa {
  final int registroAcademico;

  Aluno(
      {required String nome,
      required int numero,
      required bool valido,
      required this.registroAcademico,
      required Cidade cidade})
      : super(nome: nome, numero: numero, valido: valido, cidade: cidade);
}

class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;

  Cidade({required this.nome, required this.estado});
}


//class Professor extends Pessoa {
 // final int siape;
//}
