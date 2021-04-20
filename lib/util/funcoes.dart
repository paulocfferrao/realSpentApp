import 'dart:math';

import 'package:intl/intl.dart';

String mesAno() {
  var dataAtual = DateTime.now();

  switch (dataAtual.month) {
    case 1:
      {
        return "Janeiro " + dataAtual.year.toString();
      }
      break;

    case 2:
      {
        return "Fevereiro " + dataAtual.year.toString();
      }
      break;

    case 3:
      {
        return "Março " + dataAtual.year.toString();
      }
      break;

    case 4:
      {
        return "Abril " + dataAtual.year.toString();
      }
      break;

    case 5:
      {
        return "Maio " + dataAtual.year.toString();
      }
      break;

    case 6:
      {
        return "Junho " + dataAtual.year.toString();
      }
      break;

    case 7:
      {
        return "Julho " + dataAtual.year.toString();
      }
      break;

    case 8:
      {
        return "Agosto " + dataAtual.year.toString();
      }
      break;

    case 9:
      {
        return "Setembro " + dataAtual.year.toString();
      }
      break;

    case 10:
      {
        return "Outubro " + dataAtual.year.toString();
      }
      break;

    case 11:
      {
        return "Novembro " + dataAtual.year.toString();
      }
      break;

    case 12:
      {
        return "Dezembro " + dataAtual.year.toString();
      }
      break;
  }
}

bool mesCorrente(String dataHora) {
  ///EX.:2021.11.19.16.58
  ///    2021.3.22.21.47

  String mesAtual = new DateTime.now().month.toString();
  int inicio = dataHora.indexOf(".") + 1;
  String aux = dataHora.substring(inicio);
  int fim = aux.indexOf(".") + inicio;
  String mesOperacao =
      dataHora.substring(inicio, fim); //erro para meses com dois digitos

  if (mesOperacao == mesAtual) {
    return true;
  } else {
    return false;
  }
}

bool opDentroPeriodo(String dtOp, dtIni, dtFim) {
  ///EX.:2021.11.19.16.58
  ///    2021.3.2.21.47

  DateFormat dateFormat = DateFormat('yyyy.MM.dd.hh.mm');
  var dtOpO = dateFormat.parse(dtOp); //Converte data String em objeto

  if (dtOpO.isAfter(dtIni) && dtOpO.isBefore(dtFim)) {
    return true;
  } else {
    return false;
  }
}

double dp(double val, int places) {
  double mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}

int getLastDay(month, year) {
  //Função retorna o último dia do mes solicitado
  switch (month) {
    case 1:
      {
        return 31;
      }
      break;

    case 2:
      {
        return isLeap(year) ? 29 : 28;
      }
      break;

    case 3:
      {
        return 31;
      }
      break;

    case 4:
      {
        return 30;
      }
      break;

    case 5:
      {
        return 31;
      }
      break;

    case 6:
      {
        return 30;
      }
      break;

    case 7:
      {
        return 31;
      }
      break;

    case 8:
      {
        return 31;
      }
      break;

    case 9:
      {
        return 30;
      }
      break;

    case 10:
      {
        return 31;
      }
      break;

    case 11:
      {
        return 30;
      }
      break;

    case 12:
      {
        return 31;
      }
      break;
  }
}

bool isLeap(year) {
  /*A leap year is exactly divisible by 4 except for century years (years ending with 00).
  The century year is a leap year only if it is perfectly divisible by 400.*/

  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  } else {
    return false;
  }
}
