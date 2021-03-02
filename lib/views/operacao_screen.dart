import 'package:flutter/material.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/views/home_screen.dart';

class OperacaoScreen extends StatefulWidget {
  static const String id = '/operacao';
  @override
  _OperacaoScreenState createState() => _OperacaoScreenState();
}

String dropdownValue = 'Selecione o tipo';
Color dropColor = kSecondColor;
Operacao operacao = Operacao.vazio();

class _OperacaoScreenState extends State<OperacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: kSecondColor),
                  underline: Container(
                    height: 2,
                    color: dropColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      if (newValue == "Saída") {
                        dropColor = Colors.redAccent;
                      } else if (newValue == "Entrada") {
                        dropColor = Colors.lightGreen;
                      } else {
                        dropColor = kSecondColor;
                      }
                      dropdownValue = newValue;
                      operacao.tipo = newValue;
                    });
                  },
                  items: <String>['Selecione o tipo', 'Entrada', 'Saída']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.descricao = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Descrição'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                TextField(
                  //TODO: Select
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.categoria = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Categoria'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                TextField(
                  controller: kTextMoeda,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.valor =
                        kTextMoeda.numberValue.toString().replaceAll(".", ",");
                  },
                  keyboardType: TextInputType.number,
                  decoration: kInputDecoration.copyWith(hintText: 'Valor'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                RoundedButton(kSecondColor, 'Cadastrar', () async {
                  //TODO: Inserir usuario logado e data
                  var dataAtual = DateTime.now();
                  operacao.dataHora = dataAtual.year.toString() +
                      "." +
                      dataAtual.month.toString() +
                      "." +
                      dataAtual.day.toString() +
                      "." +
                      dataAtual.hour.toString() +
                      "" +
                      dataAtual.minute.toString();

                  operacao.usuario = auth.currentUser.email;
                  operacao.addOperacao(operacao);
                  Navigator.pushNamed(context, Home_screen.id);
                }),
                //
              ],
            ),
          ],
        ),
      ),
    );
  }
}
