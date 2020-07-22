import 'package:appfisico/components/client_tile_form.dart';
import 'package:appfisico/screens/dashboard.dart';
import 'package:appfisico/screens/novo_cliente.dart';
import 'package:flutter/material.dart';

void main() => runApp(Fisio());

class Fisio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fisio',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.purple[600],),
        primaryColor: Colors.purple[600],
      ),
      home: NewClientForm(),
    );
  }
}
