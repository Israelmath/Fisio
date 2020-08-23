import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/components/card_consulta.dart';
import 'package:appfisico/components/dialogs/dialog_consulta.dart';
import 'package:appfisico/components/mini_cliente_card.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/dao/consultas_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'headers/nova_consulta_head.dart';

class CalendarioConsulta extends StatelessWidget {
  CalendarioStore _calendarioStore;
  ConsultasDao _consultasDao;
  ClientesStore _clientesStore;

  @override
  Widget build(BuildContext context) {
    _consultasDao = ConsultasDao();
    _calendarioStore = CalendarioStore();
    _consultasDao.getAllData(DateTime.now()).then((list) {
      _calendarioStore.listaConsultas = list.asObservable();
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context).then((datePicked) {
                  if (datePicked != null)
                    _calendarioStore.alterData(datePicked);
                });
              },
            ),
          ],
          title: Text(
            'Consultas',
            style: TextStyle(fontFamily: 'Ruda', fontSize: 24),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                    ConsultaDialog(context, _calendarioStore, _consultasDao));
          },
          backgroundColor: Colors.purple,
          child: Text('+', style: TextStyle(fontFamily: 'Ruda', fontSize: 24)),
        ),
        body: Column(
          children: <Widget>[
            HeaderNovaConsulta(_calendarioStore),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return Text(
                  mascaraData(_calendarioStore.dataConsulta),
                  style: TextStyle(
                      fontFamily: 'Ruda', fontSize: 24, color: Colors.black),
                );
              }),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: Observer(
                builder: (context) {
                  return FutureBuilder(
                    future: _getConsultas(),
                    builder: (context, snapshot) {
                      final List<Consulta> _lista = snapshot.data;
                      switch (snapshot.connectionState){
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        case ConnectionState.none:
                          break;
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          return ListView.builder(
                            itemCount: _lista == null ? 0 : _lista.length,
                            itemBuilder: (context, index) {
                              _consultasDao.getAllData(_calendarioStore.dataConsulta);
                              return CardConsulta(_lista[index], _clientesStore);
                            },
                          );
                      }
                      return Text('Unknown error');
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    DateTime _datePicked = await showDatePicker(
      context: context,
      initialDate: _calendarioStore.dataConsulta,
      firstDate: DateTime(1991),
      lastDate: DateTime(2040),
    );

    if (_datePicked != null && _datePicked != DateTime.now()) {
      return _datePicked;
    }
  }

  Future<ObservableList<Consulta>> _getConsultas() async {
    _clientesStore = ClientesStore();
    _clientesStore.clientesList = await ClientDao().getAllClientes();

    if (_calendarioStore.listaConsultas.isEmpty ||
        _calendarioStore.listaConsultas == null) {
      return List();
    } else {
      return _calendarioStore.listaConsultas;
    }
  }
}
