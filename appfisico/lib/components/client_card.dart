import 'dart:io';

import 'package:appfisico/models/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ClientCard(BuildContext context, Cliente cliente) {
  return Row(
    children: <Widget>[
      Card(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${cliente.nome} ${cliente.sobrenome}',
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
                Text(cliente.cpf),
              ],
            ),
          ],
        ),
      ),
      Container(
        width: 80,
        height: 75,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                _getIcon(cliente),
                color: Colors.teal,
                size: 36,
              ),
              Text(
                cliente.particular == 1 ? 'Particular' : 'Clinica',
                style: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'Ruda',
                  fontSize: 12,
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

_getIcon(Cliente cliente) {
  if (cliente.particular == 1) {
    return Icons.local_parking;
  } else {
    return Icons.copyright;
  }
}
