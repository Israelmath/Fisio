import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/dao/consultas_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:appfisico/screens/calendario_consulta.dart';
import 'package:appfisico/screens/cliente_tela.dart';
import 'package:appfisico/screens/dashboard.dart';
import 'package:appfisico/stores/calendario_store.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:provider/provider.dart';

void main() => runApp(Fisio());

class Fisio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ClientesStore>(create: (_) => ClientesStore()),
        Provider<ConsultaStore>(create: (_) => ConsultaStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fisio',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.purple[600],
              ),
          primaryColor: Colors.purple[600],
        ),
        home: Dashboard(),
      ),
    );
  }
}
