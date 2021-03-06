import 'dart:async';

import 'package:appfisico/models/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClientDao {
  final String clienteTable = 'clienteTable';
  final String idColumn = 'idColumn';
  final String nameColumn = 'nameColumn';
  final String sobrenomeColumn = 'sobrenomeColumn';
  final String emailColumn = 'emailColumn';
  final String cpfColumn = 'cpfColumn';
  final String particularColumn = 'cpfColumn';
  final String fotoUrlColumn = 'fotoUrlColumn';

  final String dbConfig = "CREATE TABLE IF NOT EXISTS clienteTable ("
      "idColumn INTEGER PRIMARY KEY,"
      "nameColumn TEXT,"
      "sobrenomeColumn TEXT,"
      "emailColumn TEXT,"
      "cpfColumn TEXT,"
      "particularColumn INTEGER,"
      "fotoUrlColumn TEXT)";

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

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(dbConfig);
    });
  }

  Future<Cliente> saveCliente(Cliente cliente) async {
    Database dbCliente = await db;
    cliente.id = await dbCliente.insert(clienteTable, cliente.toMap());
    print('save: $cliente');
    return cliente;
  }

  Future<Cliente> getCliente(int id) async {
    Database dbCliente = await db;
    List<Map> clientesList = await dbCliente.query(clienteTable,
        columns: [
          idColumn,
          nameColumn,
          sobrenomeColumn,
          emailColumn,
          cpfColumn,
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
    List mapsClientesList = await dbCliente.rawQuery('SELECT * FROM $clienteTable');
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
