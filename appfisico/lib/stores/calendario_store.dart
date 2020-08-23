import 'package:appfisico/auxiliar/auxiliar_functions.dart';
import 'package:appfisico/dao/consultas_dao.dart';
import 'package:appfisico/models/cliente.dart';
import 'package:appfisico/models/consulta.dart';
import 'package:mobx/mobx.dart';
part 'calendario_store.g.dart';

class CalendarioStore = _CalendarioStore with _$CalendarioStore;

abstract class _CalendarioStore with Store{

  ConsultasDao _consultasDao = ConsultasDao();

  @observable
  ObservableList semana = ObservableList<DateTime>();

  @observable
  ObservableList listaConsultas = ObservableList<Consulta>();

  @observable
  DateTime dataConsulta = DateTime.now();

  @observable
  DateTime horaIcinio = DateTime.now();

  @observable
  DateTime horaTermino = DateTime.now();

  @action
  void alterData(DateTime data){
    dataConsulta = data;
    _consultasDao.getAllData(data).then((list){
      listaConsultas = list.asObservable();
    });
    if(data.isAfter(semana[6]) || data.isBefore(semana[0])) {
      semana = getSemana(dataConsulta).asObservable();
    }
  }

  @action
  void alterInicio(DateTime data){
    horaIcinio = data;
  }

  @action
  void alterTermino(DateTime data){
    horaTermino = data;
  }

  @action
  void add(Consulta consulta){
    listaConsultas.add(consulta);
  }

}