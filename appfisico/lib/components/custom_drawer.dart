import 'package:appfisico/components/drawer_tile.dart';
import 'package:appfisico/screens/calendario_consulta.dart';
import 'package:appfisico/screens/novo_cliente.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget _bgDrawer() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal[200],
                Colors.deepPurpleAccent[100].withOpacity(0.25),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _bgDrawer(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 24),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.only(top: 16, right: 16, bottom: 8),
                height: size.height * 0.2,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 0,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('images/person.png'),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 104,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Olá, Rafael!',
                            style: TextStyle(
                              fontFamily: 'Ruda',
                              fontSize: 24,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'rafael@gmail.com',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Text(
                        'Entre ou cadastre-se',
                        style: TextStyle(
                            fontFamily: 'Ruda',
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              DrawerTile('Início', Icons.home),
              DrawerTile('Consultas', Icons.assignment, whereToGo: 'Consultas'),
              DrawerTile('Pacientes', Icons.person, whereToGo: 'Pacientes'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 260),
                child: ButtonTheme(
                  child: RaisedButton(
                    child: Text(
                      'Adicionar cliente',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Ruda'),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewClientForm(),
                        ),
                      );
                    },
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
