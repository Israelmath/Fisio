import 'package:appfisico/dao/cliente_dao.dart';
import 'package:appfisico/screens/novo_cliente.dart';
import 'package:appfisico/stores/cliente_store.dart';
import 'package:flutter/material.dart';

apresentaMenu(
    BuildContext context, ClientesStore store, int index, ClientDao dao) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: FlatButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NewClientForm(
                                  cliente: store.clientesList[index],
                                );
                              },
                            ),
                          );
                          print('Editando: ${store.clientesList[index]}');
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Editar contato',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 95,
                      endIndent: 95,
                    ),
                    FlatButton(
                      onPressed: () {
                        print(
                            'Marcando consulta do cliente: ${store.clientesList[index]}');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Marcar consulta',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 95,
                      endIndent: 95,
                    ),
                    FlatButton(
                      onPressed: () {
                        print(
                            'Ligando para o cliente: ${store.clientesList[index]}');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ligar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 95,
                      endIndent: 95,
                    ),
                    FlatButton(
                      onPressed: () {
                        dao.deletCliente(store.clientesList[index].id);
                        store.removeCliente(store.clientesList, index);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Excluir',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
