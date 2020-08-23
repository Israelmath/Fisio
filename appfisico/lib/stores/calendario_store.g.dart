// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioStore on _CalendarioStore, Store {
  final _$listaConsultasAtom = Atom(name: '_CalendarioStore.listaConsultas');

  @override
  ObservableList<dynamic> get listaConsultas {
    _$listaConsultasAtom.reportRead();
    return super.listaConsultas;
  }

  @override
  set listaConsultas(ObservableList<dynamic> value) {
    _$listaConsultasAtom.reportWrite(value, super.listaConsultas, () {
      super.listaConsultas = value;
    });
  }

  final _$dataConsultaAtom = Atom(name: '_CalendarioStore.dataConsulta');

  @override
  DateTime get dataConsulta {
    _$dataConsultaAtom.reportRead();
    return super.dataConsulta;
  }

  @override
  set dataConsulta(DateTime value) {
    _$dataConsultaAtom.reportWrite(value, super.dataConsulta, () {
      super.dataConsulta = value;
    });
  }

  final _$horaIcinioAtom = Atom(name: '_CalendarioStore.horaIcinio');

  @override
  DateTime get horaIcinio {
    _$horaIcinioAtom.reportRead();
    return super.horaIcinio;
  }

  @override
  set horaIcinio(DateTime value) {
    _$horaIcinioAtom.reportWrite(value, super.horaIcinio, () {
      super.horaIcinio = value;
    });
  }

  final _$horaTerminoAtom = Atom(name: '_CalendarioStore.horaTermino');

  @override
  DateTime get horaTermino {
    _$horaTerminoAtom.reportRead();
    return super.horaTermino;
  }

  @override
  set horaTermino(DateTime value) {
    _$horaTerminoAtom.reportWrite(value, super.horaTermino, () {
      super.horaTermino = value;
    });
  }

  final _$_CalendarioStoreActionController =
      ActionController(name: '_CalendarioStore');

  @override
  void alterData(DateTime data) {
    final _$actionInfo = _$_CalendarioStoreActionController.startAction(
        name: '_CalendarioStore.alterData');
    try {
      return super.alterData(data);
    } finally {
      _$_CalendarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterInicio(DateTime data) {
    final _$actionInfo = _$_CalendarioStoreActionController.startAction(
        name: '_CalendarioStore.alterInicio');
    try {
      return super.alterInicio(data);
    } finally {
      _$_CalendarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterTermino(DateTime data) {
    final _$actionInfo = _$_CalendarioStoreActionController.startAction(
        name: '_CalendarioStore.alterTermino');
    try {
      return super.alterTermino(data);
    } finally {
      _$_CalendarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(Consulta consulta) {
    final _$actionInfo = _$_CalendarioStoreActionController.startAction(
        name: '_CalendarioStore.add');
    try {
      return super.add(consulta);
    } finally {
      _$_CalendarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaConsultas: ${listaConsultas},
dataConsulta: ${dataConsulta},
horaIcinio: ${horaIcinio},
horaTermino: ${horaTermino}
    ''';
  }
}
