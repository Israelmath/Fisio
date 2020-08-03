import 'package:flutter/material.dart';

class ConsultasBarraLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width*0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Gráficos'),
            Text('Calendário'),
            Text('Info'),
          ],
        ),
      ),
    );
  }
}
