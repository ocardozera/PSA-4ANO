/*


1)Para atribuir um valor em um atributo, qual a diferença em: 
  (i) atribuir um valor no atributo na  definição da classe; 
  e (ii) solicitar o seu valor via parâmetro do construtor?
  R: Caso atribua na definição da classe, esse valor será fixo toda vez que a classe for instanciada.
     Caso seja via parâmetro ele pode ser definido após pedir para o usuário.


2)O que é para que ser construtor? Qual código pode-se definir nele?
  R: Serve para instanciar a classe definida, pode-se definir atributos, variaveis, métodos, getters e setters.

3)Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?
  R: final é utilizado para indicar que a variável ou atributo é fixo (não muda), ele é definido em tempo de execução
     Uma vantagem seria utilizar numa situação em que você não sabe ou não quer passar um valor para a variável assim que ela é criada

4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
    * → obrigatório
    = valor (valor padrão)
    ? pode ser nulo
  Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não. 
  a) Bola{cor=branco,tamanho=7, categoria?}
  b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor
  c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, inicialize todos os atributos no contrutor utilizando parâmetros nomeados
  d) Peça{código, nome, descrição, preço de custo} 
    → get nome e descição, get preço de venda (30% sobre o preço de custo)
    → set código - somente números positivos 
    → set preço de custo - somente valore positivos
  e) Carro{nome, ano fabricação} 
    → get tempo de uso, get nome e ano fabricação
    → set ano fabricação - somente ano positivo e coerente
  f) Cidade{nome,Estado{nome,sigla}}
  g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}
  h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao}, Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}
  i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.

*/

main() {
  Estado estado = Estado("PARANÁ", "PR");
  Cidade cidade = Cidade("Paranavaí", estado);
  Categoria categoria = Categoria("A", "Categoria A");
  Tipo tipo = Tipo("A", categoria);
  UnidadeMedida unidadeMedida = UnidadeMedida("UN", "Unidade");
  Fabricante fabricante = Fabricante("Volkswagen", cidade);
  Funcionario funcionario =
      Funcionario("Thiago", "00066165400", "44996012520", cidade);
  Carro carro = Carro("Gol", 2012);
  Peca peca = Peca(
      1, "Radiador", "Radiador de água", 100, tipo, unidadeMedida, fabricante);

  print('''
Funcionário: ${funcionario.nome}
Item vendido:
> Código: ${peca.codigo}
> Descrição: ${peca.descricao} - 1 ${unidadeMedida.sigla}
> Valor: ${peca.getPrecoVenda}

''');
}

class Bola {
  String cor = "branco";
  int tamanho = 7;
  String? categoria;
}

class Professor {
  int id;
  String nome;
  String cpf;
  String email;

  Professor(this.id, this.nome, this.cpf, this.email);
}

class Aluno {
  final int ra;
  final String nome;
  final String cpf;
  final String telefone;

  Aluno(
      {required this.ra,
      required this.nome,
      required this.cpf,
      required this.telefone});
}

class Peca {
  int codigo;
  String nome;
  String descricao;
  double precoCusto;
  Tipo tipo;
  UnidadeMedida unidadeMedida;
  Fabricante fabricante;

  Peca(this.codigo, this.nome, this.descricao, this.precoCusto, this.tipo,
      this.unidadeMedida, this.fabricante);

  String get getNome {
    return nome;
  }

  String get getDescricao {
    return descricao;
  }

  double get getPrecoVenda {
    double valorAcrescimo = (precoCusto * 30) / 100;
    double precoVenda = precoCusto + valorAcrescimo;
    return precoVenda;
  }

  set setCodigo(int codigo) {
    if (codigo >= 0) {
      this.codigo = codigo;
    }
  }

  set setPrecoCusto(double precoCusto) {
    if (precoCusto >= 0) {
      this.precoCusto = precoCusto;
    }
  }
}

class Carro {
  String nome;
  int anoFabricacao;

  Carro(this.nome, this.anoFabricacao);

  String get getNome {
    return nome;
  }

  int get getAnoFabricacao {
    return anoFabricacao;
  }

  int get getTempoUso {
    if (anoFabricacao > 0) {
      int tempoDeUso;

      int anoAtual = DateTime.now().year;
      tempoDeUso = anoAtual - anoFabricacao;
      return tempoDeUso;
    }
  }

  set setAnoFabricacao(int anoFabricacao) {
    if (anoFabricacao >= 0) {
      this.anoFabricacao = anoFabricacao;
    }
  }
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

class Funcionario {
  String nome;
  String cpf;
  String telefone;
  Cidade cidade;

  Funcionario(this.nome, this.cpf, this.telefone, this.cidade);
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante(this.nome, this.cidade);
}

class UnidadeMedida {
  String sigla;
  String descricao;

  UnidadeMedida(this.sigla, this.descricao);
}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo(this.nome, this.categoria);
}

class Categoria {
  String nome;
  String descricao;

  Categoria(this.nome, this.descricao);
}
