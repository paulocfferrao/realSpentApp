import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'file:///C:/Users/pfpau/AndroidStudioProjects/real_spent_app/lib/model/ScreenArguments.dart';
import 'package:real_spent_app/globals.dart' as globals;
import 'package:real_spent_app/util/funcoes.dart';
import 'package:real_spent_app/views/home_screen.dart';

class OperacaoScreen extends StatefulWidget {
  static const String id = '/operacao';
  @override
  _OperacaoScreenState createState() => _OperacaoScreenState();
}

String dropdownValue = 'Selecione o tipo';
String dropdownValueCat = 'Selecione a categoria';

Color dropColor = kSecondColor;
Color dropColorCat = kSecondColor;

//List<String> categorias = Categoria.getCategorias();

Operacao operacao = null;
int c = 0; //Contador para controlar se dropdown já foi utilizado

class _OperacaoScreenState extends State<OperacaoScreen> {
  @override
  void initState() {
    //categorias = Categoria.getCategorias();
    c = 0;
    operacao = null;

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
        dropdownValueCat = 'Selecione a categoria';
        dropColor = kSecondColor;
      }
    } else {
      operacao = args.operacao;
      kTextMoeda.text = operacao.valor;
      dropdownValue = operacao.tipo;
      dropdownValueCat = operacao.categoria;
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
                    color: dropColorCat,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueCat = newValue; //CategoriaDrop
                      operacao.categoria = newValue;
                    });
                  },
                  items: globals.gCategorias
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  initialValue:
                      operacao.descricao == null ? "" : operacao.descricao,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //debugger();
                    operacao.descricao = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Descrição'),
                ),

                SizedBox(
                  height: kMarginInput,
                ),
                TextFormField(
                  controller: kTextMoeda,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    operacao.valor = doubleToString(kTextMoeda.numberValue);
                  },
                  keyboardType: TextInputType.number,
                  decoration: kInputDecoration.copyWith(hintText: 'Valor'),
                ),
                SizedBox(
                  height: kMarginInput,
                ),
                RoundedButton(kSecondColor, 'Cadastrar', () async {
                  var dataAtual = DateTime
                      .now(); //TODO: Permitir escolha da data pelo usuário

                  operacao.dataHora = dataAtual.year.toString() +
                      "." +
                      zeroAEsquerda(dataAtual.month) +
                      "." +
                      zeroAEsquerda(dataAtual.day) +
                      "." +
                      zeroAEsquerda(dataAtual.hour) +
                      "." +
                      zeroAEsquerda(dataAtual.minute);

                  operacao.usuario = auth.currentUser.email;
                  if (args == null) {
                    await operacao.addOperacao(operacao);
                  } else {
                    await Operacao.editarOperacao(args.id, operacao);
                  }
                  // operacao = null;
                  //globals.flag = false;
                  c = 0;
                  //preenche(context);
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
