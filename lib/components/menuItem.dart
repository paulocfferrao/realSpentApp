import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    this.texto,
    this.onTapF,
  }) : super(key: key);

  final String texto;
  final Function onTapF;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        texto,
        style: kOptionsTextStyle,
      ),
      onTap: onTapF,
    );
  }
}
