import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'modelos_auxiliares.dart';

String mascaraCelular(String cel) {
  return '(${cel.substring(0, 2)}) ${cel.substring(2, 3)}.${cel.substring(3, 7)}-${cel.substring(7)}';
}

String mascaraNome(String nome){
  String _nome = nome.replaceAll(new RegExp(r"\s+"), ' ');

  if(_nome.split(' ').length < 3){
    return _nome;
  }
  else{
    String nomeAux = '';
    List<String> nomeList = _nome.split(' ');
    int i = 0;
    while(i < nomeList.length){
      if(i == 0){
        nomeAux = nomeList[i];
      }
      else if (i == nomeList.length - 1){
        nomeAux = nomeAux + ' ' + nomeList[i];
      }
      else{
        nomeAux = nomeAux + ' ' + nomeList[i][0];
      }
      i++;
    }
    return nomeAux;
  }
}

String mascaraCpf(String cpf){
  if(cpf.length != 11) return cpf;
  else return '${cpf.substring(0,3)}.${cpf.substring(3,6)}.${cpf.substring(6,9)}-${cpf.substring(9,11)}';
}

String verificaOrigem(int org){
  if(org == 1) return 'Particular';
  else return 'Clínica';
}

String mascaraData(DateTime data){
  int _dia = data.day;
  int _mes = data.month;
  int _ano = data.year;

  final _meses = meses;

  return '$_dia de ${_meses[_mes]} de $_ano';
}

String mascaraHora(DateTime data){
  if(data != null) {
    return '${data.hour}h${data.minute}';
  }
  else return '00h00';
}

String mascaraSemana(DateTime data){
  if(data != null) {
    return diaSemana[data.weekday];
  }
  else return 'Dia da semana';
}

ObservableList<DateTime> getSemana(DateTime data){
  DateTime dia = data;
  ObservableList<DateTime> semana = ObservableList<DateTime>();

  while(dia.weekday != 7){
    dia = dia.subtract(Duration(days: 1));
  }

  while(dia.weekday != 6){
    semana.add(dia);
    dia = dia.add(Duration(days: 1));
  }
  semana.add(dia);
  return semana;
}
