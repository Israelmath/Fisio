import 'package:appfisico/components/custom_drawer.dart';
import 'package:appfisico/components/proximas_consultas_box.dart';
import 'package:appfisico/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'headers/dashboard_head.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          HeadDashboard(),
          ProximasConsultas(),
        ],
      ),
    );
  }
}
