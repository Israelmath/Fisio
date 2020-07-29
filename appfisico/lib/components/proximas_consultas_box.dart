import 'package:appfisico/components/client_card.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:flutter/material.dart';

class NextInterviews extends StatefulWidget {
  @override
  _NextInterviewsState createState() => _NextInterviewsState();
}

class _NextInterviewsState extends State<NextInterviews> {

  ClientDao _clienteDao = ClientDao();
  List<Cliente> clientesList = List();

  @override
  void initState() {
    super.initState();

    _clienteDao.getAllClientes().then((list){
      clientesList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 16,
      height: size.height - 320,
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Próximas consultas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Ruda',
            ),
          ),
          Container(
            color: Colors.teal,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: clientesList.length,
              itemBuilder: (context, index){
                return ClientCard(context, clientesList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
