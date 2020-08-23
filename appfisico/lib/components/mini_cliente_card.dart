import 'dart:io';

import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';

class MiniClientCard extends StatefulWidget {
  Cliente cliente;
  bool selected;
  Function chosen;

  MiniClientCard(this.cliente, this.chosen, {this.selected});

  @override
  _MiniClientCardState createState() => _MiniClientCardState();
}

class _MiniClientCardState extends State<MiniClientCard> {
  @override
  void initState() {
    super.initState();
    widget.selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
        if (widget.selected)
          widget.chosen(
            widget.cliente,
          );
      },
      child: Container(
        height: 70,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _getImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  mascaraNome(
                      '${widget.cliente.nome} ${widget.cliente.sobrenome}'),
                  style: TextStyle(fontSize: 16, fontFamily: 'Ruda'),
                ),
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.selected == true ? Colors.purple : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getImage() {
    if (widget.cliente.fotoUrl == null) {
      return AssetImage('images/person.png');
    } else {
      return FileImage(File(widget.cliente.fotoUrl));
    }
  }
}
