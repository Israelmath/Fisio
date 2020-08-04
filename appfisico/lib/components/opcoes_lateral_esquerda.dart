import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsultasBarraLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Button_left(Icons.equalizer, context, 'Estatísticas'),
            Button_left(Icons.date_range, context, 'Marcar consulta'),
            Button_left(Icons.menu, context, 'Info'),
          ],
        ),
      ),
    );
  }

  GestureDetector Button_left(
      IconData icone, BuildContext context, String infoButton) {
    return GestureDetector(
      onLongPress: () {
        createSnackBar(context, infoButton);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple[100]),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.purple.withOpacity(0.2),
                offset: Offset(3, 3),
                blurRadius: 3),
          ],
        ),
        child: Icon(
          icone,
          color: Colors.purple,
        ),
      ),
    );
  }

  void createSnackBar(BuildContext context, String nomeButton) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      content: Text(
        nomeButton,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Ruda', fontSize: 16),
      ),
      duration: Duration(seconds: 2),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
