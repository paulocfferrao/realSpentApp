import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:real_spent_app/util/ScreenArguments.dart';
import 'package:real_spent_app/views/home_screen.dart';
import 'package:real_spent_app/views/operacao_screen.dart';

longPress(id) {
  print(id);
  //
}

TextButton componenteOperacao(descricao, categoria, valor, tipo, id, context) {
  var estilo;
  if (tipo == "Entrada") {
    estilo = kIncomeTextStyle;
  } else {
    estilo = kOutcomeTextStyle;
  }

  var _width = double.infinity;
  var _height = 80.0;

  return TextButton(
    onLongPress: () async {
      if (await confirm(
        context,
        title: Text('Confirmar exclusão'),
        content: Text('Tem certeza que deseja excluir a operação?'),
        textOK: Text('Sim'),
        textCancel: Text('Não'),
      )) {
        Operacao.deletarOperacao(id);
        Navigator.pop(context);
        Navigator.pushNamed(context, Home_screen.id);
      }
      //return print('pressedCancel');
    },
    onPressed: () {
      Operacao operacao = Operacao(descricao, tipo, categoria, valor, "", "");
      Navigator.pushNamed(context, OperacaoScreen.id,
          arguments: ScreenArguments(operacao, id));
    },
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
