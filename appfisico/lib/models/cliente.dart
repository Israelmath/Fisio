class Cliente{
  int id;
  String nome;
  String sobrenome;
  String email;
  int cel;
  int cpf;
  bool particular;
  String fotoUrl;

  Cliente();

  Cliente.fromMap(Map map){
    id = map['idColumn'];
    nome = map['nameColumn'];
    sobrenome = map['sobrenomeColumn'];
    email = map['emailColumn'];
    cpf = map['cpfColumn'];
    particular = map['particularColumn'];
    fotoUrl = map['fotoUrlColumn'];
  }

  Map toMap(){
    Map<String, dynamic> mapCliente = {
      'nameColumn': nome,
      'sobrenomeColumn': sobrenome,
      'emailColumn': email,
      'cpfColumn': cpf,
      'particularColumn': particular,
      'fotoUrlColumn': fotoUrl
    };
    if(id != null){
      mapCliente['idColumn'] = id;
    }
    return mapCliente;
  }

  @override
  String toString() {
    return 'Cliente{id: $id, nome: $nome, sobrenome: $sobrenome, email: $email, cpf: $cpf, particular: $particular, fotoUrl: $fotoUrl}';
  }
}