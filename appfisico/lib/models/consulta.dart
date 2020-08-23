import 'package:flutter/material.dart';

class Consulta{
  int id;
  String titulo;
  String evolucao = '';
  DateTime dataConsulta;
  DateTime horaIcinio;
  DateTime horaTermino;
  int idCliente;
  int nivelDor = 0;

  Consulta();

  Consulta.fromMap(Map map){
    id = map['idColumn'];
    titulo = map['tituloColumn'];
    evolucao = map['evolucaoColumn'];
    dataConsulta = DateTime.fromMicrosecondsSinceEpoch(map['dataConsultaColumn']);
    horaIcinio = DateTime.fromMicrosecondsSinceEpoch(map['horaInicioColumn']);
    horaTermino = DateTime.fromMicrosecondsSinceEpoch(map['horaTerminoColumn']);
    idCliente = map['idClienteColumn'];
    nivelDor = map['nivelDorColumn'];
  }

  Map toMap(){
    Map<String, dynamic> mapConsulta = {
      'tituloColumn': titulo,
      'evolucaoColumn': evolucao,
      'dataConsultaColumn': dataConsulta.microsecondsSinceEpoch,
      'horaInicioColumn': horaIcinio.microsecondsSinceEpoch,
      'horaTerminoColumn': horaTermino.microsecondsSinceEpoch,
      'idClienteColumn': idCliente,
      'nivelDorColumn': nivelDor
    };
    if(id != null){
      mapConsulta['idColumn'] = id;
    }
    return mapConsulta;
  }

  @override
  String toString() {
    return 'Consulta{id: $id, titulo: $titulo, evolucao: $evolucao, dataConsulta: $dataConsulta, horaIcinio: $horaIcinio, horaTermino: $horaTermino, idCliente: $idCliente, nivelDor: $nivelDor}';
  }
}