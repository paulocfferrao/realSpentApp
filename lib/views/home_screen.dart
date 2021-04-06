import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_spent_app/components/ListaOperacoes.dart';
import 'package:real_spent_app/components/menu.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/util/buildValueListenableBuilder.dart';
import 'package:real_spent_app/util/datas.dart';
import 'package:real_spent_app/views/operacao_screen.dart';
import 'package:real_spent_app/globals.dart' as globals;

class Home_screen extends StatefulWidget {
  static const String id = '/home';
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var valores = [
      Vlb.buildValueListenableBuilder(globals.gTotalEntradas, kIncomeTextStyle),
      Vlb.buildValueListenableBuilder(globals.gTotalSaidas, kOutcomeTextStyle),
      Vlb.buildValueListenableBuilder(globals.gTotal, kHeaderTextStyle)
    ];

    //var style = [kIncomeTextStyle, kOutcomeTextStyle, kHeaderTextStyle];
    var mesAtual = mesAno();

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondColor,
        title: Text(
          mesAtual,
          style: kTextStyle,
        ),
      ),
      endDrawer: Menu(),
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //tempAtualizaCaterias();
          Navigator.pushNamed(context, OperacaoScreen.id);
          //Categoria().addCategoria("Alimentação");
        },
        label: Text('Adicionar'),
        icon: Icon(Icons.add_circle),
        backgroundColor: kSecondColor,
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double heightScreen = MediaQuery.of(context).size.height;
          double widthScreen = MediaQuery.of(context).size.width;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                width: double.maxFinite,
                height: 170,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170.0,
                    autoPlay: true,
                  ),
                  items: [0, 1, 2].map((i) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          //borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          child: Center(
                            child: valores[i],
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: heightScreen - 170 - 94,
                child: ListView(
                  children: [
                    ListaOperacoes(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// void tempAtualizaCaterias() async {
//   final _operacoes = FirebaseFirestore.instance.collection("operacoes");
//
//   await for (var snapshot in _operacoes.snapshots()) {
//     for (var operacao in snapshot.docs) {
//       var nOperacao = Operacao.toObject(operacao);
//       nOperacao.categoria = "Alimentação";
//       print(nOperacao.categoria);
//       Operacao.editarOperacao(operacao.id, nOperacao);
//     }
//   }
//
//   print("ok");
// }
