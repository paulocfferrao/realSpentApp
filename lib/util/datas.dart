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
