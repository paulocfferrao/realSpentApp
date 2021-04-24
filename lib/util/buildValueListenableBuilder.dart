import 'funcoes.dart';
import 'package:real_spent_app/globals.dart' as globals;
import 'package:flutter/cupertino.dart';

class Vlb {
  static ValueListenableBuilder<double> buildValueListenableBuilder(
      globalValue, style) {
    return ValueListenableBuilder(
      valueListenable: globalValue,
      builder: (context, value, _) {
        value = dp(value, 2);
        var str = "R\$ " + doubleToString(value);
        return Text(
          str,
          style: style,
        );
      },
    );
  }

  static ValueListenableBuilder<List<Widget>>
      buildValueListenableBuilderList() {
    return ValueListenableBuilder(
      valueListenable: globals.gComponentes,
      builder: (context, value, _) {
        ///preenche(context);
        value = globals.gComponentes.value;
        return ListView(
          children: value,
        );
      },
    );
  }
}
