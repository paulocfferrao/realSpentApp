import 'package:flutter/cupertino.dart';

class Vlb {
  static ValueListenableBuilder<double> buildValueListenableBuilder(
      globalValue, style) {
    return ValueListenableBuilder(
      valueListenable: globalValue,
      builder: (context, value, _) {
        return Text(
          "R\$ $value",
          style: style,
        );
      },
    );
  }
}
