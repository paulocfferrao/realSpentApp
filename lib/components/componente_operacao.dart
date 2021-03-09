import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';

TextButton componenteOperacao(descricao, categoria, valor, tipo) {
  var estilo;
  if (tipo == "Entrada") {
    estilo = kIncomeTextStyle;
  } else {
    estilo = kOutcomeTextStyle;
  }

  return TextButton(
    onPressed: null,
    onLongPress: null,
    child: Container(
      width: double.infinity,
      height: 80,
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
