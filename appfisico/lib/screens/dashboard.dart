import 'package:appfisico/models/proximas_consultas_box.dart';
import 'package:appfisico/models/search_bar.dart';
import 'package:flutter/material.dart';

import 'headers/dashboard_head.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            print('Estão me construindo...');
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          HeadDashboard(),
          SearchBar(),
          NextInterviews(),
        ],
      ),
    );
  }
}
