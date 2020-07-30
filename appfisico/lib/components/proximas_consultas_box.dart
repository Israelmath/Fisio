import 'package:appfisico/components/client_card.dart';
import 'package:appfisico/components/menus/opcoes_contato.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class NextInterviews extends StatefulWidget {
  @override
  _NextInterviewsState createState() => _NextInterviewsState();
}

class _NextInterviewsState extends State<NextInterviews> {
  ClientDao _clienteDao = ClientDao();

  ClientesStore clienteStore;

  @override
  void initState() {
    super.initState();

    _clienteDao.getAllClientes().then((list) {
      clienteStore.clientesList = list.asObservable();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    clienteStore = Provider.of<ClientesStore>(context);

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
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: clienteStore.clientesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        print('Length: ${clienteStore.clientesList.length}');
                        apresentaMenu(
                            context, clienteStore, index, _clienteDao);
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.only(top: 4),
                        child: ClientCard(
                            context, clienteStore.clientesList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
