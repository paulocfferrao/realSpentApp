import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color corBotao;
  final String textoBotao;
  final Function funcaoBotao;

  RoundedButton(this.corBotao, this.textoBotao, this.funcaoBotao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: corBotao,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: funcaoBotao,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textoBotao,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
