import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';

TextButton operacaoButton(descricao, categoria, valor, tipo) {
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
                style: kInTextStyle,
              ),
              Text(
                categoria,
                style: kInTextStyle.copyWith(color: Colors.black),
              ),
            ],
          ),
          Text(
            "R\$ " + valor,
            style: kInTextStyle.copyWith(fontSize: 30),
          ),
        ],
      ),
    ),
  );
}
