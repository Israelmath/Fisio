import 'package:appfisico/components/card_avaliacao.dart';
import 'package:appfisico/components/consultas_barra_lateral.dart';
import 'package:appfisico/components/opcoes_laterais.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/screens/headers/cliente_tela_head.dart';
import 'package:flutter/material.dart';

class ClienteTela extends StatelessWidget {
  Cliente cliente;

  ClienteTela(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${cliente.nome} ${cliente.sobrenome}',
          style: TextStyle(
            fontFamily: 'Ruda',
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              debugPrint('Editando...');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ClienteHeader(cliente),
          CardAvaliacao(cliente),
          Row(
            children: <Widget>[
              ConsultasBarraLateral(),
              OpcoesLaterais(cliente),
            ],
          ),
        ],
      ),
    );
  }
}
