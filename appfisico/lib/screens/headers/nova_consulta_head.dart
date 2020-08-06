import 'package:appfisico/stores/calendario_store.dart';
import 'package:flutter/material.dart';

class HeaderNovaConsulta extends StatelessWidget {
  Size size;
  CalendarioStore _calendarioStore;

  HeaderNovaConsulta(this._calendarioStore);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height*0.1,
          decoration: BoxDecoration(
            color: Colors.purple[600],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            boxShadow: [BoxShadow(color: Colors.purple.withOpacity(0.2), offset: Offset(0,5), blurRadius: 3)]
          ),
        ),
      ],
    );
  }
}
