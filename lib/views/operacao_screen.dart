import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/util/ScreenArguments.dart';

class OperacaoScreen extends StatefulWidget {
  static const String id = '/operacao';
  @override
  _OperacaoScreenState createState() => _OperacaoScreenState();
}

String dropdownValue = 'Selecione o tipo';
Color dropColor = kSecondColor;
Operacao operacao = null;
int c = 0; //Contador para controlar se dropdown já foi utilizado

class _OperacaoScreenState extends State<OperacaoScreen> {
  @override
  void initState() {
    c = 0;
    //  operacao = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    if (args == null) {
      operacao = operacao == null ? Operacao.vazio() : operacao;

      if (c == 0) {
        kTextMoeda.text = "0,00";
        dropdownValue = "Selecione o tipo";
        dropColor = kSecondColor;
      }
    } else {
      operacao = args.operacao;
      kTextMoeda.text = operacao.valor;
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
                      c++;
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
                      kTextMoeda, //todo: Bug na edição de operação: mostrando um zero a menos
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
                  // operacao = null;
                  //globals.flag = false;
                  Navigator.pop(context);

                  //Navigator.pushNamed(context, Home_screen.id);
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
