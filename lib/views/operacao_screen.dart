import 'package:flutter/material.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/util/ScreenArguments.dart';
import 'package:real_spent_app/views/home_screen.dart';

class OperacaoScreen extends StatefulWidget {
  static const String id = '/operacao';
  @override
  _OperacaoScreenState createState() => _OperacaoScreenState();
}

String dropdownValue;
Color dropColor;
Operacao operacao;

class _OperacaoScreenState extends State<OperacaoScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    if (args == null) {
      dropdownValue = 'Selecione o tipo';
      dropColor = kSecondColor;
      operacao = Operacao.vazio();
    } else {
      operacao = args.operacao;
      kTextMoeda.text = operacao.valor == null ? null : operacao.valor;
      dropdownValue = operacao.tipo;
      if (operacao.tipo == "Entrada") {
        dropColor = Colors.lightGreen;
      } else {
        dropColor = Colors.redAccent;
      }
    }
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
                TextFormField(
                  initialValue:
                      operacao.descricao == null ? "" : operacao.descricao,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.descricao = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Descrição'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                TextFormField(
                  initialValue:
                      operacao.categoria == null ? "" : operacao.categoria,

                  //TODO: Select (carregar cadastradas)
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.categoria = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Categoria'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                TextFormField(
                  controller:
                      kTextMoeda, //todo: inserir valor recebido por paremetro com o controller
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
                  var dataAtual = DateTime.now();
                  operacao.dataHora = dataAtual.year.toString() +
                      "." +
                      dataAtual.month.toString() +
                      "." +
                      dataAtual.day.toString() +
                      "." +
                      dataAtual.hour.toString() +
                      "." +
                      dataAtual.minute.toString();

                  operacao.usuario = auth.currentUser.email;
                  if (args == null) {
                    operacao.addOperacao(operacao);
                  } else {
                    Operacao.editarOperacao(args.id, operacao);
                  }

                  Navigator.pop(context);
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
