import 'dart:io';

import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget ClientCard(BuildContext context, Cliente cliente) {
  String teste = _getText(cliente);

  return Stack(
    overflow: Overflow.clip,
    children: <Widget>[
      Positioned(
        bottom: 0,
        right: 0,
        width: 90,
        height: 50,
        child: Card(
          color: _getColor(cliente),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(teste, style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
      Container(
        height: 80,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _getImage(cliente),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text( mascaraNome('${cliente.nome} ${cliente.sobrenome}'),
                      style: TextStyle(
                        fontFamily: 'Ruda',
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      cliente.email,
                      style: TextStyle(
                        fontFamily: 'Ruda',
                      ),
                    ),
                    Text(mascaraCpf(cliente.cpf)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

_getImage(Cliente cliente) {
  if (cliente.fotoUrl == null) {
    return AssetImage("images/person.png");
  } else {
    return FileImage(File(cliente.fotoUrl));
  }
}

String _getText(Cliente cliente) {
  if (cliente.particular == 1) {
    return 'Particular';
  } else {
    return 'Clínica';
  }
}

_getColor(Cliente cliente) {
  if (cliente.particular == 1) {
    return Colors.blue;
  } else {
    return Colors.redAccent;
  }
}
