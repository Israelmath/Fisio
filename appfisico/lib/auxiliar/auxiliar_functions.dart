import 'package:flutter/material.dart';

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

  Map meses = {
    1: 'Janeiro',
    2: 'Fevereiro',
    3: 'Março',
    4: 'Abril',
    5: 'Maio',
    6: 'Junho',
    7: 'Julho',
    8: 'Agosto',
    9: 'Setembro',
    10: 'Outubro',
    11: 'Novembro',
    12: 'Dezembro'
  };

  return '$_dia de ${meses[_mes]} de $_ano';
}