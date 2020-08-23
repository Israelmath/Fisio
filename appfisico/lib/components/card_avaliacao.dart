import 'package:appfisico/components/dialogs/dialog_avaliacao.dart';
import 'package:flutter/material.dart';

class CardAvaliacao extends StatelessWidget {
  Function callback;
  String avaliacao;
  CardAvaliacao(this.callback, {@required this.avaliacao});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: 150,
      child: Card(
        elevation: 2,
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: Card(
                    elevation: 2,
                    child: GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DialogAvaliacao(callback);
                            });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( '${avaliacao}',
                style: TextStyle(color: Colors.black, fontFamily: 'Ruda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
