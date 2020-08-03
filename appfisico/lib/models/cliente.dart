class Cliente{
  int id;
  String nome;
  String sobrenome;
  String email;
  String celular;
  String cpf;
  String avaliacao = 'Sem avaliação';
  int particular;
  String fotoUrl;

  Cliente();

  Cliente.fromMap(Map map){
    id = map['idColumn'];
    nome = map['nameColumn'];
    sobrenome = map['sobrenomeColumn'];
    celular = map['celularColumn'];
    email = map['emailColumn'];
    cpf = map['cpfColumn'];
    avaliacao = map['avaliacaoColumn'];
    particular = map['particularColumn'];
    fotoUrl = map['fotoUrlColumn'];
  }

  Map toMap(){
    Map<String, dynamic> mapCliente = {
      'nameColumn': nome,
      'sobrenomeColumn': sobrenome,
      'celularColumn': celular,
      'emailColumn': email,
      'cpfColumn': cpf,
      'particularColumn': particular,
      'avaliacaoColumn': avaliacao,
      'fotoUrlColumn': fotoUrl
    };
    if(id != null){
      mapCliente['idColumn'] = id;
    }
    return mapCliente;
  }

  @override
  String toString() {
    return 'Cliente{id: $id, nome: $nome, sobrenome: $sobrenome, email: $email, celular: $celular, cpf: $cpf, avaliacao: $avaliacao, particular: $particular, fotoUrl: $fotoUrl}';
  }
}