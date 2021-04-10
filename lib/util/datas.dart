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
  ///    2021.3.22.21.47

  DateFormat dateFormat = DateFormat('yyyy.MM.dd.hh.mm');
  var dtOpO = dateFormat.parse(dtOp); //Converte data String em objeto

  if (dtOpO.isAfter(dtIni) && dtOpO.isBefore(dtFim)) {
    return true;
  } else {
    return false;
  }
}
