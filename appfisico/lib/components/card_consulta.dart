import 'dart:io';

import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:provider/provider.dart';

class CardConsulta extends StatelessWidget {
  Consulta _consulta;
  Cliente _cliente;
  ClientesStore _clientesStore = ClientesStore();
  List<Cliente> clientes;

  CardConsulta(this._consulta, this.clientes);

  @override
  Widget build(BuildContext context) {
    debugPrint('Olá!');
    print(clientes);
    _clientesStore.clientesList = _getClientes() as ObservableList;
    print('Consulta: $_consulta\n');
    print('Cliente: ${_clientesStore.clientesList}');
    for (Cliente c in _clientesStore.clientesList) {
      if (c.id == _consulta.idCliente) {
        _cliente = c;
        break;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      '${_consulta.horaInicio.hour} h ${_consulta.horaInicio.minute}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Ruda')),
                  Text(
                      '${_consulta.horaTermino.hour} h ${_consulta.horaTermino.minute}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Ruda')),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    width: 5,
                    height: 90,
                    decoration: BoxDecoration(
                      color:
                          _cliente.particular == 1 ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                    '${_consulta.horaInicio.hour} h ${_consulta.horaInicio.minute} '
                                    '- ${_consulta.horaTermino.hour} h ${_consulta.horaTermino.minute}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Ruda')),
                                Text(
                                    mascaraNome(
                                        '${_cliente.nome} ${_cliente.sobrenome}'),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Ruda')),
                                Text(mascaraCelular(_cliente.celular),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8,
                                        fontFamily: 'Ruda')),
                              ],
                            ),
                          ),
                          VerticalDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                  _cliente.particular == 1
                                      ? 'Particular'
                                      : 'Clínica',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Ruda')),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _getImage(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _getImage() {
    if (_cliente.fotoUrl == null) {
      return AssetImage('images/person.png');
    } else {
      return FileImage(File(_cliente.fotoUrl));
    }
  }
  Future<List<Cliente>> _getClientes() async {
    ClientDao _clienteDao = ClientDao();
    return await _clienteDao.getAllClientes();
  }
}
