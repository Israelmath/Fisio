import 'package:mobx/mobx.dart';
part 'calendario_store.g.dart';

class CalendarioStore = _CalendarioStore with _$CalendarioStore;

abstract class _CalendarioStore with Store{

  @observable
  DateTime date = DateTime.now();

  @action
  void alterData(DateTime data){
    date = data;
  }
}