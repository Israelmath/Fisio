import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';

class DialogAvaliacao extends StatelessWidget {
  Function callback;
  TextEditingController _avaliacaoController = TextEditingController();

  DialogAvaliacao(this.callback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Avaliação', style: TextStyle(fontSize: 24, fontFamily: 'Ruda'),),
      content: TextField(
        controller: _avaliacaoController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Confirmar'),
          onPressed: () {
            callback(_avaliacaoController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
