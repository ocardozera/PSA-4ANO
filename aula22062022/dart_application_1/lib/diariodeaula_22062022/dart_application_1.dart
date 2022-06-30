import 'dart:io';

main() {
  //sintaxe parecida com java
  //MinhaClasse minhaClasse = MinhaClasse();

  //em dart, o new é opcional - existe por questão de adaptação
  //MinhaClasse minhaclasseAux = MinhaClasse();

  //neste caso, em dart, recomenda-se utilizar a inferência de tipo

  //quando define os parametros pelo construtor, quando cria o objeto ja tem que ter os valores
  var minhaClasseAuxDois = MinhaClasse("oioi", 50, true);

  minhaClasseAuxDois.nome = stdin.readLineSync();
  minhaClasseAuxDois.numero = 50;
  minhaClasseAuxDois.valido = true;

  print(minhaClasseAuxDois.nome);

  //encapsulamento é feito por arquivo (o privado do Dart não é por classe, é sim por arquivo)
}

/*
MODIFICADOR DE ACESSO
- por padrão já é publica

NOME DA CLASSE
- para o nome da classe utilizamos UpperCamelCase

pra deixar privado tem que colocar _ (underline) para deixar a classe privada

*/

class MinhaClasse {
  //se vc nao ta encapsulando, nao ta protegendo, deixa o atributo publico;

  // ? na frente do tipo indica que o atributo pode ser nulo
  //String? nome;
  int? numero;
  bool? valido;
  final bool valido;

  //final - define em tempo de execução
  //const - define em tempo de compilação (ja tem que definir um valor)

  String
      _nome; // para tornar um atributoprivado, basta colocar _ (underline) antes do nome

  //Exemplode get em dart:
  String get nome {
    return _nome;
  }

  //MinhaClasse minhaClasse = MinhaClasse();
  //minhaClasse.nome; - exemplo de get

  //exemplo de set
  set nome(String nome) {
    _nome = nome;
  }

  //late bool valido - inicializacao tardia,

  //quando a variavel nao pode ser nula, é obrigatorio pedir a variavel no construtor (nome, this.nome)

  MinhaClasse(this.nome, this.numero, this.valido);
}

/*
ARQUIVO

- Recomenda-se (não precisa) que o nome do arquivo seja o mesmo  nome
*/
