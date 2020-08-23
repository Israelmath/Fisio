import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/components/client_card.dart';
import 'package:appfisico/components/search_bar.dart';
import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/screens/cliente_tela.dart';
import 'package:appfisico/screens/headers/clientes_head.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:appfisico/components/menus/opcoes_contato.dart';

class ClientesTela extends StatelessWidget {
  ClientesStore _clienteStore;
  ClientDao _clientDao;
  

  @override
  Widget build(BuildContext context) {
    _clienteStore = Provider.of<ClientesStore>(context);
    _clientDao = ClientDao();
  _clientDao.getAllClientes().then((clientsList){
    _clienteStore.clientesList = clientsList.asObservable();
  });

    
    return Scaffold(
      appBar: AppBar(
        title: Text(mascaraNome('Gandalf Mitrhandir'), style: TextStyle(fontFamily: 'Ruda', fontSize: 24),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClientesHead(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SearchBar(),
          ),
          Expanded(
            child: Observer(
              builder: (_){
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: _clienteStore.clientesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return ClienteTela(_clienteStore.clientesList[index]);
                        }));
                      },
                      onLongPress: () {
                        apresentaMenu(context, _clienteStore, index, _clientDao);
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.only(top: 4),
                        child: ClientCard(context, _clienteStore.clientesList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
