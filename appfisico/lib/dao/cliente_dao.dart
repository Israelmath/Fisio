import 'dart:async';

import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClientDao {
  final String clienteTable = 'clienteTable';
  final String idColumn = 'idColumn';
  final String nameColumn = 'nameColumn';
  final String sobrenomeColumn = 'sobrenomeColumn';
  final String celularColumn = 'celularColumn';
  final String emailColumn = 'emailColumn';
  final String cpfColumn = 'cpfColumn';
  final String avaliacaoColumn = 'avaliacaoColumn';
  final String particularColumn = 'cpfColumn';
  final String fotoUrlColumn = 'fotoUrlColumn';

  final String dbConfigCliente = "CREATE TABLE IF NOT EXISTS clienteTable ("
      "idColumn INTEGER PRIMARY KEY,"
      "nameColumn TEXT,"
      "sobrenomeColumn TEXT,"
      "celularColumn TEXT,"
      "emailColumn TEXT,"
      "cpfColumn TEXT,"
      "particularColumn INTEGER,"
      "avaliacaoColumn TEXT,"
      "fotoUrlColumn TEXT)";

  final String dbConfigConsulta = "CREATE TABLE IF NOT EXISTS consultaTable ("
      "idColumn INTEGER PRIMARY KEY,"
      "tituloColumn TEXT,"
      "evolucaoColumn TEXT,"
      "dataConsultaColumn INTEGER,"
      "horaInicioColumn INTEGER,"
      "horaTerminoColumn INTEGER,"
      "idClienteColumn INTEGER,"
      "nivelDorColumn INTEGER)";

  final String nomeDb = 'calendor.db';
  static final ClientDao _instance = ClientDao.internal();

  factory ClientDao() => _instance;

  ClientDao.internal();

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

    return await openDatabase(path, version: 1, onDowngrade: onDatabaseDowngradeDelete,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(dbConfigCliente);
      await db.execute(dbConfigConsulta);
    });
  }

  Future<Cliente> saveCliente(Cliente cliente) async {
    Database dbCliente = await db;
    cliente.id = await dbCliente.insert(clienteTable, cliente.toMap()).catchError((erro)=>debugPrint('$erro'));
    debugPrint('Cliente save:${cliente.toMap()}');
    return cliente;
  }

  Future<Cliente> getCliente(int id) async {
    Database dbCliente = await db;
    List<Map> clientesList = await dbCliente.query(clienteTable,
        columns: [
          idColumn,
          nameColumn,
          sobrenomeColumn,
          celularColumn,
          emailColumn,
          cpfColumn,
          avaliacaoColumn,
          particularColumn,
          fotoUrlColumn
        ],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (clientesList.length > 0) {
      return Cliente.fromMap(clientesList.first);
    } else {
      return null;
    }
  }

  Future<int> deletCliente(int id) async {
    Database dbCliente = await db;
    return await dbCliente.delete(
      clienteTable,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateCliente(Cliente cliente) async {
    Database dbCliente = await db;
    return await dbCliente.update(
      clienteTable,
      cliente.toMap(),
      where: '$idColumn = ?',
      whereArgs: [cliente.id],
    );
  }

  Future<List> getAllClientes() async {
    Database dbCliente = await db;
    List mapsClientesList = await dbCliente.rawQuery('SELECT * FROM $clienteTable').catchError((erro){
      if(erro != null)
        return List<Map<String, dynamic>>();
    });
    List<Cliente> clientesList = List();
    for (Map clt in mapsClientesList){
      clientesList.add(Cliente.fromMap(clt));
    }
    return clientesList;
  }

  Future turnOffDatabase() async {
    Database dbCliente = await db;
    dbCliente.close();
  }
}
