import 'package:appfisico/components/client_tile_form.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewClientForm extends StatefulWidget {
  @override
  _NewClientFormState createState() => _NewClientFormState();
}

class _NewClientFormState extends State<NewClientForm> {
  String _cliente = 'Novo cliente';
  String nome;
  String sobrenome;
  String email;
  int cel;
  int cpf;
  Cliente _editingContact = Cliente();
  bool _newClient = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _editingContact.particular = _newClient;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _cliente,
          style: TextStyle(
            fontFamily: 'Ruda',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple[600].withOpacity(0.3),
                      offset: Offset(0, 5),
                      blurRadius: 3,
                    )
                  ],
                  color: Colors.purple[600],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Positioned(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    _editingContact.email != null ? _editingContact.email : '',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ruda',
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    _editingContact.cel != null
                        ? _editingContact.cel.toString()
                        : '',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ruda',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.08 - 40,
              left: size.width * 0.5 - 40,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
                child: Image.asset(
                  'images/person.png',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: size.width * 0.025,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                height: size.height * 0.7,
                width: size.width * 0.95,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: Text(
                          'Dados pessoais',
                          style: TextStyle(
                            fontFamily: 'Ruda',
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ClientTileForm(Icons.account_circle, 'Nome', getContent,
                          nomeController: true),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClientTileForm(
                            Icons.person, 'Sobrenome', getContent),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClientTileForm(
                            Icons.alternate_email, 'Email', getContent),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClientTileForm(
                            Icons.phone_android, 'Celular', getContent),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClientTileForm(
                            Icons.assignment_ind, 'CPF', getContent),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          height: 112,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 8.0),
                                child: Text(
                                  'Origem',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Ruda',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 16.0),
                                child: VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                      title: Text(
                                        'Particular',
                                      ),
                                      value: _newClient,
                                      onChanged: (valor) {
                                        _editingContact.particular = valor;
                                        setState(() {
                                          _newClient = valor;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      value: !_newClient,
                                      onChanged: (valor) {
                                        setState(() {
                                          _newClient = !valor;
                                        });
                                      },
                                      title: Text(
                                        'Clínica',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          _send();
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Ruda',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getContent(String content, String campo, bool nomeController) {
    if (nomeController == true) {
      _editingContact.nome = content;
      setState(() {
        if (_editingContact.sobrenome != null)
          _cliente = '${_editingContact.nome} ${_editingContact.sobrenome}';
        else
          _cliente = '${_editingContact.nome}';
      });
    } else if (campo == 'Sobrenome') {
      _editingContact.sobrenome = content;
      if (_editingContact.nome != null) {
        setState(() {
          _cliente = '${_editingContact.nome} ${_editingContact.sobrenome}';
        });
      }
    } else if (campo == 'Email')
      _editingContact.email = content;
    else if (campo == 'Celular')
      _editingContact.cel = int.tryParse(content);
    else if (campo == 'CPF') _editingContact.cpf = int.tryParse(content);
  }

  void _send() {
    print(_editingContact.toString());
//    print('Nome: $nome\nSobrenome: $sobrenome\nEmail: $email\nCelular: $cel\nCPF: $cpf\nOrigem: $_newClient');
  }
}
