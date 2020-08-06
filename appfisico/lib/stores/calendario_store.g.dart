// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioStore on _CalendarioStore, Store {
  final _$dateAtom = Atom(name: '_CalendarioStore.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
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
  String toString() {
    return '''
date: ${date}
    ''';
  }
}
