import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/globals.dart' as globals;
import 'package:real_spent_app/model/Operacao.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:real_spent_app/util/funcoes.dart';

String dropdownValueCat = 'Selecione a categoria';

class Relatorio_screen extends StatefulWidget {
  static String id = "/relatorio";

  @override
  _Relatorio_screenState createState() => _Relatorio_screenState();
}

class _Relatorio_screenState extends State<Relatorio_screen> {
  String initialDate = null;
  String finalDate = null;

  calendario(String data) async {
    DateTime temp = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, DateTime.now().month),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    setState(() {
      if (data == "inicio") {
        initialDate = kShowDateFormat.format(temp).toString();
      } else {
        finalDate = kShowDateFormat.format(temp).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondColor,
        title: Text(
          "Relatórios",
          style: kHeaderTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Selecione o periodo:",
                style: kHeaderTextStyle.copyWith(fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            calendario("inicio");
                          },
                          icon: Icon(
                            Icons.calendar_today,
                          )),
                      SizedBox(
                        child: TextField(
                          decoration: kInputDecoration.copyWith(
                            contentPadding: EdgeInsets.all(5),
                          ),
                          controller: TextEditingController(
                            text: initialDate,
                          ),
                        ),
                        width: 110,
                        height: 30,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            calendario("fim");
                          },
                          icon: Icon(
                            Icons.calendar_today,
                          )),
                      SizedBox(
                        child: TextField(
                          decoration: kInputDecoration.copyWith(
                              contentPadding: EdgeInsets.all(5)),
                          controller: TextEditingController(
                            text: finalDate,
                          ),
                        ),
                        width: 110,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueCat,
                icon: Icon(
                  Icons.arrow_downward,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: kSecondColor),
                underline: Container(
                  height: 2,
                  color: kSecondColor,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueCat = newValue; //CategoriaDrop
                    //operacao.categoria = newValue;
                  });
                },
                items: globals.gCategorias
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: kHeaderTextStyle.copyWith(fontSize: 25),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(kSecondColor, 'GERAR RELATÓRIO', () async {
                //todo: testar
                double entradas = 0.0;
                double saidas = 0.0;
                double total = 0.0;
                String categoria = dropdownValueCat == "Selecione a categoria"
                    ? "Todas"
                    : dropdownValueCat;

                DateFormat dateFormat = DateFormat('dd/MM/yyyy');

                List lista = await Operacao.getOperacoes(
                    dateFormat.parse(initialDate),
                    dateFormat.parse(finalDate),
                    dropdownValueCat);

                for (Operacao op in lista) {
                  if (op.tipo == "Entrada") {
                    entradas += double.parse(op.valor.replaceAll(",", "."));
                  } else if (op.tipo == "Saída") {
                    saidas += double.parse(op.valor.replaceAll(",", "."));
                  }
                }

                total = entradas - saidas;

                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    color: Colors.grey,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 4,
                              width: 70,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$initialDate - $finalDate",
                                  style: TextStyle(
                                    fontFamily: kMainFont,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Categoria: $categoria",
                                  //textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: kMainFont,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Entradas: ",
                                      style: TextStyle(
                                        fontFamily: kMainFont,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      doubleToString(dp(entradas, 2)),
                                      style: kIncomeTextStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Saídas: ",
                                      style: TextStyle(
                                        fontFamily: kMainFont,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      doubleToString(dp(saidas, 2)),
                                      style: kOutcomeTextStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                        fontFamily: kMainFont,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      doubleToString(dp(total, 2)),
                                      style: kOutcomeTextStyle.copyWith(
                                        fontSize: 20,
                                        color: total >= 0.0
                                            ? Colors.greenAccent
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
