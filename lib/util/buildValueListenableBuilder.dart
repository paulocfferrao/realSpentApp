import 'funcoes.dart';

import 'package:flutter/cupertino.dart';

class Vlb {
  static ValueListenableBuilder<double> buildValueListenableBuilder(
      globalValue, style) {
    return ValueListenableBuilder(
      valueListenable: globalValue,
      builder: (context, value, _) {
        value = dp(value, 2);
        return Text(
          "R\$ $value",
          style: style,
        );
      },
    );
  }
}
