import 'package:flutter/material.dart';

class ClientTileForm extends StatelessWidget {
  final IconData icon;
  final String hint;
  bool nomeController;
  bool tecladoNumerico;
  final Function _getContent;

  ClientTileForm(this.icon, this.hint, this._getContent, {this.nomeController, this.tecladoNumerico});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          Container(
            height: 37,
            width: size.width * 0.7,
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
              keyboardType: tecladoNumerico != null ? TextInputType.number : null,
              onChanged: (text) {
                _getContent(text, hint, nomeController == null ? false : true);
              },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
