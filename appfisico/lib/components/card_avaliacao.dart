import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';

class CardAvaliacao extends StatelessWidget {
  final Cliente _cliente;

  CardAvaliacao(this._cliente);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: 150,
      child: Card(
        elevation: 2,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Avaliação',
                    style: TextStyle(
                        fontSize: 24, fontFamily: 'Ruda', color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Card(
                    elevation: 2,
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '${_cliente.avaliacao}',
                style: TextStyle(
                  fontFamily: 'Ruda',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
