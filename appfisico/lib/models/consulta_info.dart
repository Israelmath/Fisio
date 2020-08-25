
class ConsultaInfo{
  int idConsulta;
  String titulo;
  String evolucao;
  DateTime dataConsulta;
  DateTime horaInicio;
  DateTime horaTermino;
  int idCliente;
  int nivelDor;
  String nome;
  String sobrenome;
  String celular;
  int particular;
  String avaliacao;
  String fotoUrl;

  ConsultaInfo();

  ConsultaInfo.fromMap(Map map){
    idConsulta = map['idColumn'];
    titulo = map['tituloColumn'];
    evolucao = map['evolucaoColumn'];
    dataConsulta = DateTime.fromMicrosecondsSinceEpoch(map['dataConsultaColumn']);
    horaInicio = DateTime.fromMicrosecondsSinceEpoch(map['horaInicioColumn']);
    horaTermino = DateTime.fromMicrosecondsSinceEpoch(map['horaTerminoColumn']);
    idCliente = map['idClienteColumn'];
    nivelDor = map['nivelDorColumn'];
    nome = map['nameColumn'];
    sobrenome = map['sobrenomeColumn'];
    celular = map['celularColumn'];
    particular = map['particularColumn'];
    avaliacao = map['avaliacaoColumn'];
    fotoUrl = map['fotoUrlColumn'];
  }

  Map toMap(){
    Map<String, dynamic> mapConsultaInfo = {
    'tituloColumn': titulo,
    'evolucaoColumn': evolucao,
    'dataConsultaColumn': dataConsulta,
    'horaInicioColumn': horaInicio,
    'horaTerminoColumn': horaTermino,
    'idClienteColumn': idCliente,
    'nivelDorColumn': nivelDor,
    'nameColumn': nome,
    'sobrenomeColumn': sobrenome,
    'celularColumn': celular,
    'particularColumn': particular,
    'avaliacaoColumn': avaliacao,
    'fotoUrlColumn': fotoUrl
    };
    return mapConsultaInfo;
  }

  @override
  String toString() {
    return 'ConsultaInfo{idConsulta: $idConsulta, titulo: $titulo, evolucao: $evolucao, dataConsulta: $dataConsulta, horaInicio: $horaInicio, horaTermino: $horaTermino, idCliente: $idCliente, nivelDor: $nivelDor, nome: $nome, sobrenome: $sobrenome, celular: $celular, particular: $particular, avaliacao: $avaliacao, fotoUrl: $fotoUrl}';
  }
}