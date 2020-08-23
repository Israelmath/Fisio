import 'package:appfisico/screens/calendario_consulta.dart';
import 'package:appfisico/screens/contatos_tela.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String _texto;
  final IconData _icone;
  final String whereToGo;

  DrawerTile(this._texto, this._icone, {@required this.whereToGo});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  if(whereToGo == 'Consultas') {
                    return CalendarioConsulta();
                  }
                  if(whereToGo == 'Pacientes'){
                    return ClientesTela();
                  }
                },
              ));
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(_icone),
              SizedBox(
                width: 16,
              ),
              Text(
                _texto,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ruda',
                  color: Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
