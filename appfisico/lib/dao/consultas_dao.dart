import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/models/consulta_info.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class ConsultasDao {
  final String clienteTable = 'clienteTable';
  final String consultaTable = 'consultaTable';
  final String idColumn = 'idColumn';
  final String titulo = 'tituloColumn';
  final String evolucao = 'evolucaoColumn';
  final String dataConsulta = 'dataConsultaColumn';
  final String horaInicio = 'horaInicioColumn';
  final String horaTermino = 'horaTerminoColumn';
  final String idCliente = 'idClienteColumn';
  final String nivelDor = 'nivelDorColumn';

  final String dbConfig = "CREATE TABLE IF NOT EXISTS consultaTable ("
      "idColumn INTEGER PRIMARY KEY,"
      "tituloColumn TEXT,"
      "evolucaoColumn TEXT,"
      "dataConsultaColumn INTEGER,"
      "horaInicioColumn INTEGER,"
      "horaTerminoColumn INTEGER,"
      "idClienteColumn INTEGER,"
      "nivelDorColumn INTEGER)";

  final String nomeDb = 'calendor.db';
  static final ConsultasDao _instance = ConsultasDao.internal();

  factory ConsultasDao() => _instance;

  ConsultasDao.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null)
      return _db;
    else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, nomeDb);

    return await openDatabase(path,
        version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }

  Future<Consulta> saveConsulta(Consulta consulta) async {
    Database dbConsulta = await db;
    consulta.id = await dbConsulta
        .insert(consultaTable, consulta.toMap())
        .catchError((error) => print('Erro: $error'));
    return consulta;
  }

  Future<List<Consulta>> getConsulta(DateTime ConsultaData) async {
    Database dbConsulta = await db;
    List<Map> consultaLista = await dbConsulta.query(consultaTable,
        columns: [
          idColumn,
          titulo,
          evolucao,
          dataConsulta,
          horaInicio,
          horaTermino,
          idCliente,
          nivelDor
        ],
        where: '$dataConsulta = ?',
        whereArgs: [ConsultaData]);

    if (consultaLista.length > 0) {
      List<Consulta> returnedList = List();
      for (Map c in consultaLista) {
        returnedList.add(Consulta.fromMap(c));
      }
      return returnedList;
    } else
      return List<Consulta>();
  }

  Future<int> deleteConsulta(int id) async {
    Database dbCosulta = await db;
    return await dbCosulta
        .delete(consultaTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  updateConsulta(Consulta consulta) async {
    Database dbConsulta = await db;
    return await dbConsulta.update(consultaTable, consulta.toMap(),
        where: '$idColumn = ?', whereArgs: [consulta.id]);
  }

  Future<List<Consulta>> getAll() async {
    Database dbConsulta = await db;
    List<Map> consultasListMap = await dbConsulta.query(consultaTable, orderBy: '$dataConsulta');
    List<Consulta> consultasListInst = List();
    if (consultasListMap.length > 0) {
      for (Map consulta in consultasListMap) {
        consultasListInst.add(Consulta.fromMap(consulta));
      }
      return consultasListInst;
    } else
      return List();
  }

  Future<List<Consulta>> getAllData(DateTime diaConsulta) async {
    Database dbConsulta = await db;
    int diaDepois = DateTime(diaConsulta.year, diaConsulta.month, diaConsulta.day, 23, 59)
            .microsecondsSinceEpoch;

    int diaAntes = DateTime(diaConsulta.year, diaConsulta.month, diaConsulta.day, 00, 00)
            .microsecondsSinceEpoch;

    List<Consulta> consultasDoDia = List();
    List<Map> consultasMap = await dbConsulta.rawQuery(
        'SELECT * FROM $consultaTable '
        'WHERE ($dataConsulta >= $diaAntes AND $dataConsulta <= $diaDepois)');

    for (Map consulta in consultasMap){
      consultasDoDia.add(Consulta.fromMap(consulta));
    }
    return consultasDoDia;
  }

  Future<List<ConsultaInfo>> getProximasConsultas() async {
    Database dbCosulta = await db;
    List<ConsultaInfo> proximasConsultas = List();
    List<Map> consultasMap = await dbCosulta.rawQuery(
      'SELECT * FROM $consultaTable cst JOIN $clienteTable clt ON clt.$idColumn = cst.$idCliente ORDER BY cst.$dataConsulta LIMIT 2'
    );

    for (Map consulta in consultasMap){
      proximasConsultas.add(ConsultaInfo.fromMap(consulta));
    }
    return proximasConsultas;
  }

  Future turnOffDatabase() async {
    Database dbConsulta = await db;
    dbConsulta.close();
  }
}
