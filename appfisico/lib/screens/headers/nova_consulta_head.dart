import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/src/api/observable_collections.dart';

class HeaderNovaConsulta extends StatelessWidget {
  Size size;
  ConsultaStore _calendarioStore;

  HeaderNovaConsulta(this._calendarioStore);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _calendarioStore.semana = getSemana(_calendarioStore.dataConsulta);

    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.purple[600],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.purple.withOpacity(0.2),
                  offset: Offset(0, 5),
                  blurRadius: 3)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
            child: Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[0])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[0]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[0].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[0])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[0])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[0]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[1])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[1]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[1].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[1])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[1])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[1]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[2])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[2]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[2].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[2])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[2])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[2]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[3])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[3]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[3].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[3])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[3])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[3]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[4])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[4]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[4].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[4])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[3])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[4]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[5])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[5]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[5].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[5])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[5])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[5]);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text(
                            mascaraSemana(_calendarioStore.semana[6])
                                .substring(0, 3),
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[6]),
                                fontFamily: 'Ruda'),
                          ),
                          Text(
                            '${_calendarioStore.semana[6].day}',
                            style: TextStyle(
                                color: _getColor(_calendarioStore.semana[6])),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColor(_calendarioStore.semana[6])),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      onTap: (){
                        _calendarioStore.alterData(_calendarioStore.semana[6]);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  _getColor(DateTime dia) {
    if (dia.isAtSameMomentAs(_calendarioStore.dataConsulta)) {
      return Colors.white;
    } else
      return Colors.grey;
  }
}
