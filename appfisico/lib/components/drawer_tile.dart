import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String _texto;
  final IconData _icone;

  DrawerTile(this._texto, this._icone);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
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
