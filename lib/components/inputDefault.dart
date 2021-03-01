import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Usuario.dart';

class inputDefault extends StatelessWidget {
  const inputDefault.inputDefault({
    Key key,
    this.textInputType,
    this.obscureText: false,
    @required this.usuario,
    this.field,
  }) : super(key: key);

  final String field;
  final Usuario usuario;
  final textInputType;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kMarginInput, bottom: kMarginInput),
      child: TextField(
        keyboardType: textInputType,
        textAlign: TextAlign.center,
        obscureText: obscureText,
        onChanged: (value) {
          switch (field) {
            case "Digite seu nome":
              {
                usuario.nome = value;
              }
              break;

            case 'Digite seu e-mail':
              {
                usuario.email = value;
              }
              break;
            case 'Crie uma senha':
              {
                usuario.senha = value;
              }
              break;
          }
          ;
        },
        decoration: kInputDecoration.copyWith(hintText: '$field'),
      ),
    );
  }
}
