import 'package:appfisico/components/card_consulta.dart';
import 'package:appfisico/components/client_card.dart';
import 'package:appfisico/components/menus/opcoes_contato.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/dao/consultas_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/screens/cliente_tela.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ProximasConsultas extends StatefulWidget {
  @override
  _ProximasConsultasState createState() => _ProximasConsultasState();
}

class _ProximasConsultasState extends State<ProximasConsultas> {
  ConsultasDao _consultasDao = ConsultasDao();
  CalendarioStore _consultasStore;
  ClientDao _clienteDao = ClientDao();
  ClientesStore _clienteStore;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 16,
      height: size.height - 320,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Próximas consultas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Ruda',
            ),
          ),
          Container(
            color: Colors.teal,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return FutureBuilder(
                  future: _getInfo(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                        break;
                      case ConnectionState.done:
                        return ListView.builder(
                          padding: EdgeInsets.all(8.0),
                          itemCount: _consultasStore.listaConsultas.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              padding: EdgeInsets.only(top: 4),
                              child: CardConsulta(
                                  _consultasStore.listaConsultas[index], _clienteStore),
                            );
                          },
                        );
                    }
                    return Text('Não rolou...');
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _getInfo() async {
    _consultasStore = CalendarioStore();
    _consultasDao.getProximasConsultas() = _consultasStore.listaConsultas as Observable;
    _clienteDao.getAllClientes().then((clientesList) {
      _clienteStore.clientesList = clientesList.asObservable();
    });
  }
}
