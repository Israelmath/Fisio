import 'package:appfisico/components/card_avaliacao.dart';
import 'package:appfisico/components/opcoes_lateral_esquerda.dart';
import 'package:appfisico/components/info_lateral_direita.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/screens/headers/cliente_tela_head.dart';
import 'package:appfisico/screens/novo_cliente.dart';
import 'package:flutter/material.dart';

class ClienteTela extends StatefulWidget {
  Cliente cliente;

  ClienteTela(this.cliente);

  @override
  _ClienteTelaState createState() => _ClienteTelaState();
}

class _ClienteTelaState extends State<ClienteTela> {
  ClientDao _dao = ClientDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.cliente.nome} ${widget.cliente.sobrenome}',
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
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewClientForm(cliente: widget.cliente)));
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ClienteHeader(widget.cliente),
          CardAvaliacao(callback, avaliacao: widget.cliente.avaliacao),
          Row(
            children: <Widget>[
              ConsultasBarraLateral(),
              OpcoesLaterais(widget.cliente),
            ],
          ),
        ],
      ),
    );
  }
  void callback(String avaliacao){
    setState(() {
      widget.cliente.avaliacao = avaliacao;
      _dao.updateCliente(widget.cliente);
    });
  }
}
