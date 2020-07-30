// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientesStore on _ClientesStore, Store {
  final _$clientesListAtom = Atom(name: '_ClientesStore.clientesList');

  @override
  ObservableList<dynamic> get clientesList {
    _$clientesListAtom.reportRead();
    return super.clientesList;
  }

  @override
  set clientesList(ObservableList<dynamic> value) {
    _$clientesListAtom.reportWrite(value, super.clientesList, () {
      super.clientesList = value;
    });
  }

  final _$_ClientesStoreActionController =
      ActionController(name: '_ClientesStore');

  @override
  void removeCliente(List<dynamic> clientesList, int index) {
    final _$actionInfo = _$_ClientesStoreActionController.startAction(
        name: '_ClientesStore.removeCliente');
    try {
      return super.removeCliente(clientesList, index);
    } finally {
      _$_ClientesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionaCliente(List<dynamic> clienteList, Cliente cliente) {
    final _$actionInfo = _$_ClientesStoreActionController.startAction(
        name: '_ClientesStore.adicionaCliente');
    try {
      return super.adicionaCliente(clienteList, cliente);
    } finally {
      _$_ClientesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientesList: ${clientesList}
    ''';
  }
}
