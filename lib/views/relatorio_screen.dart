import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/globals.dart' as globals;

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
              RoundedButton(kSecondColor, 'GERAR RELATÓRIO', () {
                //todo: Gerar relatório

                // Mostra modal
                // Categoria = dropdownValueCat / todos
                // Periodo initialDate até finalDate
                // Entradas: R$ xxx,xx
                // Saídas: R$ xxx,xx
                // Total: R$ xxx,xx > Padrão de cores da home

                /*todo: função que retorne lista de operações, pode ser utilizada para home_screen e histórico
                       Parametros: data inicial, data final, categoria, usuario*/
              }),
            ],
          ),
        ),
      ),
    );
    //throw UnimplementedError();
  }
}
