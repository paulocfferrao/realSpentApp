library real_spent_app.globals;

import 'package:flutter/cupertino.dart';

ValueNotifier<double> gTotalEntradas = ValueNotifier(0.0);
ValueNotifier<double> gTotalSaidas = ValueNotifier(0.0);
ValueNotifier<double> gTotal = ValueNotifier(0.0);

List<String> gCategorias =
    []; // Atualizar sempre após realizar qualquer manutenção em categorias.
//bool flag = false;
