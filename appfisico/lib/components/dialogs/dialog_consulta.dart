import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/components/mini_cliente_card.dart';
import 'package:appfisico/dao/consultas_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

AlertDialog ConsultaDialog(BuildContext context, ConsultaStore calendarioStore, ConsultasDao consultasDao) {
  final Consulta _consulta = Consulta();
  ConsultaStore _calendarioStore = calendarioStore;

  ClientesStore _clientesStore = Provider.of<ClientesStore>(context);

  void _chosenClient(Cliente cliente) {
    _consulta.idCliente = cliente.id;
  }

  return AlertDialog(
    contentPadding: EdgeInsets.all(8),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[100],
          child: Image.asset('images/calendar.png', scale: 2),
        ),
        Text('Marcar consulta',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontFamily: 'Ruda')),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            onSubmitted: (text) {
              _consulta.titulo = text;
            },
            decoration: InputDecoration(
              hintText: 'Título',
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    _setDate(context, _consulta, _calendarioStore);
                  },
                  child: Observer(
                    builder: (context) => Text(
                        '${mascaraSemana(_calendarioStore.dataConsulta)}',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Ruda',
                            fontSize: 19)),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _setDate(context, _consulta, _calendarioStore);
                  },
                  child: Observer(builder: (_) {
                    return Text(mascaraData(_calendarioStore.dataConsulta),
                        style: TextStyle(fontFamily: 'Ruda'));
                  }),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                        .then((hora) {
                      _consulta.horaInicio =
                          DateTime(2020, 1, 1, hora.hour, hora.minute);
                      _calendarioStore.horaIcinio = _consulta.horaInicio;
                    });
                  },
                  child: Observer(
                    builder: (context) {
                      return Text(mascaraHora(_calendarioStore.horaIcinio),
                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16));
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                        .then((hora) {
                      _consulta.horaTermino =
                          DateTime(2020, 1, 1, hora.hour, hora.minute);
                      _calendarioStore.horaTermino = _consulta.horaTermino;
                    });
                  },
                  child: Observer(
                    builder: (context) {
                      return Text(mascaraHora(_calendarioStore.horaTermino),
                          style: TextStyle(fontFamily: 'Ruda', fontSize: 16));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          'Escolha o cliente',
          style: TextStyle(fontSize: 24),
        ),
        Container(
          height: 150,
          child: ListView.builder(
              itemCount: _clientesStore.clientesList.length,
              itemBuilder: (context, index) {
                return MiniClientCard(
                    _clientesStore.clientesList[index], _chosenClient);
              }),
        ),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('Confirm'),
        onPressed: () {
          _send(_calendarioStore, _consulta, consultasDao);
          Navigator.pop(context);
        },
      ),
    ],
  );
}


void _send(ConsultaStore calendarioStore, Consulta consulta, ConsultasDao consultasDao) {
  calendarioStore.add(consulta);
  consultasDao.saveConsulta(consulta);
  consulta = Consulta();
}

void _setDate(BuildContext context, Consulta consulta, ConsultaStore calendarioStore) {
  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040))
      .then((data) {
    calendarioStore.dataConsulta = data;
    consulta.dataConsulta = data;
  });
}