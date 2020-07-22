import 'package:flutter/material.dart';

class NextInterviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 16,
      height: size.height - 320,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Próximas consultas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Ruda',
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
