import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientesHead extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 32,
            decoration: BoxDecoration(
              color: Colors.purple[600],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.2),
                  offset: Offset(1, 1),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/person.png'),
                ),
              ),
            ),
          ),
          Positioned(
            left: 96,
            top: 16,
            child: Container(
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Cel: ${mascaraCelular('11972757721')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ruda',
                        fontSize: 16,
                    ),
                  ),
                  Text(
                    'CPF: ${mascaraCpf('36219636856')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ruda',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
