import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClienteHeader extends StatelessWidget {
  Cliente _cliente;

  ClienteHeader(this._cliente);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.20,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.20 - 32,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.2),
                  offset: Offset(-5, 3),
                  blurRadius: 3,
                ),
              ],
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(125),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: size.width * 0.12,
            right: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  mascaraCelular(_cliente.celular),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Ruda',
                  ),
                ),
                Text(
                  verificaOrigem(_cliente.particular),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Ruda',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Como o paciente está',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Ruda',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 55,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/person.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
