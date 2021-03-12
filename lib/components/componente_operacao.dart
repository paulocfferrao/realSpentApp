import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';

longPress(id) {
  print(id);
  //
}

TextButton componenteOperacao(descricao, categoria, valor, tipo, id) {
  var estilo;
  if (tipo == "Entrada") {
    estilo = kIncomeTextStyle;
  } else {
    estilo = kOutcomeTextStyle;
  }

  var _width = double.infinity;
  var _height = 80.0;

  return TextButton(
    onPressed: () {
      //TODO: Confirmação de exclusão e recarregar home
      Operacao.deletarOperacao(id);

      print(id);
    },
    //nLongPress: null,
    child: Container(
      width: _width,
      height: _height,
      //color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                descricao,
                style: estilo.copyWith(fontSize: 30.0),
              ),
              Text(
                categoria,
                style: estilo.copyWith(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
          Text(
            "R\$ " + valor,
            style: estilo.copyWith(fontSize: 30.0),
          ),
        ],
      ),
    ),
  );
}
