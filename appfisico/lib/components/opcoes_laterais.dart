import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';

class OpcoesLaterais extends StatelessWidget {
  final Cliente _cliente;

  final String _textoEvolucao =
  '- Fez legpress mesmo com a coluna quebrada,\nSuper bem de saúde, mesmo com a a valiacao feita,\n- Deve ser pescado logo.';

  OpcoesLaterais(this._cliente);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 3),
            child: Container(
              width: size.width * 0.75,
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.purple.withOpacity(0.2), offset: Offset(-3, 0), blurRadius: 5)],
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Próxima consulta',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ruda',
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    '25 de agosto',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ruda',
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Ás 15h00',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ruda',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 96,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
                color: Colors.purple[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Última evolução!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Ruda'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 24, right: 108),
                    child: Text(
                      _textoEvolucao,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
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
