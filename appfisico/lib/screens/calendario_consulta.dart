import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'headers/nova_consulta_head.dart';

class CalendarioConsulta extends StatelessWidget {
  CalendarioStore _calendarioStore;

  @override
  Widget build(BuildContext context) {
    _calendarioStore = CalendarioStore();

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
                builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.all(16),
                      title: Text(
                        'Marcar consulta',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontFamily: 'Ruda'),
                      ),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 200.0),
                            child: Image.asset('images/calendar.png', scale: 1.95),
                          ),
//                          Divider(thickness: 2),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Título',
                            ),
                          ),
//                          Divider(thickness: 2),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  print('Qua, 05 de Ago de 2020');
                                },
                                child: Text('Qua, \n05 de ago de 2020'),
                              ),
                              FlatButton(
                                onPressed: (){
                                  print('16 h 00');
                                },
                                child: Text('16h00'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Confirm'),
                          onPressed: () {
                            print('Opa!');
                          },
                        ),
                      ],
                    ));
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
                  mascaraData(_calendarioStore.date),
                  style: TextStyle(
                      fontFamily: 'Ruda', fontSize: 24, color: Colors.black),
                );
              }),
            ),
            Text('Bottom'),
          ],
        ));
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    DateTime _datePicked = await showDatePicker(
      context: context,
      initialDate: _calendarioStore.date,
      firstDate: DateTime(1991),
      lastDate: DateTime(2040),
    );

    if (_datePicked != null && _datePicked != DateTime.now()) {
      return _datePicked;
    }
  }
}
