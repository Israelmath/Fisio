import 'package:appfisico/models/cliente.dart';
import 'package:mobx/mobx.dart';
part 'cliente_store.g.dart';

class ClientesStore = _ClientesStore with _$ClientesStore;

abstract class _ClientesStore with Store{

  @observable
  ObservableList clientesList = ObservableList<Cliente>();

  @action
  void removeCliente(List clientesList, int index){
    clientesList.removeAt(index);
  }

  @action
  void adicionaCliente(List clienteList, Cliente cliente){
    clienteList.add(cliente);
  }
}