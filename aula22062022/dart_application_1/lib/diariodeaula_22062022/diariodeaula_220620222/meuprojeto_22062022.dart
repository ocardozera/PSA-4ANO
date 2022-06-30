import 'dart:io';

main() {
  Estado estado = Estado("Paraná", "PR");
  Cidade cidade = Cidade("Paranavaí", estado);
  TipoLancamento receita = TipoLancamento(1, "Receita");
  TipoLancamento despesa = TipoLancamento(2, "Despesa");
  Pessoa pessoa = Pessoa(1, "Matheus Cardoso", "44991361481", cidade);

  Lancamento lancamentoReceita = Lancamento(1, 25, receita, pessoa);
  Lancamento lancamentoDespesa = Lancamento(2, 10, despesa, pessoa);

  print("Nome: " + pessoa.nome);
  print("---------------------------");
  print("Lançamento - " + lancamentoReceita.tipoLancamento.descricao);
  print("Valor: R\$ " + lancamentoReceita.valor.toString());
  print("---------------------------");
  print("Lançamento - " + lancamentoDespesa.tipoLancamento.descricao);
  print("Valor: R\$ " + lancamentoDespesa.valor.toString());
  print("---------------------------");
}

class Pessoa {
  final int id;
  final String nome;
  final String telefone;
  final Cidade cidade;

  Pessoa(this.id, this.nome, this.telefone, this.cidade);
}

class Lancamento {
  int id;
  double valor;
  TipoLancamento tipoLancamento;
  Pessoa pessoa;

  Lancamento(this.id, this.valor, this.tipoLancamento, this.pessoa);
}

class TipoLancamento {
  int id;
  String descricao;

  TipoLancamento(this.id, this.descricao);
}

class Cidade {
  String nome;
  Estado estado;

  Cidade(this.nome, this.estado);
}

class Estado {
  String nome;
  String sigla;

  Estado(this.nome, this.sigla);
}



//Pessoa, Lancamentos, Cidade, Estado