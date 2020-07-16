import 'package:flutter/material.dart';

class HeadDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 24,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 4),
                  color: Colors.purple[600].withOpacity(0.20),
                  blurRadius: 2,
                )
              ],
              color: Colors.purple[600],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16),
                child: Text(
                  'Olá, Rafael!',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ruda',
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  'Verifique se tem pacientes para\natender hoje',
                  style: TextStyle(
                    fontFamily: 'Ruda',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
