import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/components/menuItem.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Usuario.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              Usuario.emailLogado(),
              style: kTextStyle,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: kBackgroundColor,
            ),
          ),
          MenuItem(
            texto: "Relatórios",
            onTapF: () {
              //todo: Programar tela de relatórios
            },
          ),
          MenuItem(
            texto: "Histórico",
            onTapF: () {
              //todo: Programar tela de Histórico
            },
          ),
          MenuItem(
            texto: "Categorias",
            onTapF: () {
              //todo: Programar manutenção de categarias
            },
          ),
          MenuItem(
            texto: "Sair",
            onTapF: () {
              Usuario.sair(context);
            },
          ),
        ],
      ),
    );
  }
}
