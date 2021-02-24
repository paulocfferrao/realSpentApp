import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Categoria.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';

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

//
//  @override
//  void dispose() {
//
//    super.dispose();
//  }

  //int i = 0;
  @override
  Widget build(BuildContext context) {
    //TODO: Programar tela inicial do app.
    // double heightScreen = MediaQuery.of(context).size.height;
    // double widthScreen = MediaQuery.of(context).size.width;

    var var1 = ["R\$ 10,00", "R\$ 90,00", "- R\$ 80,00"];
    var style = [kIncomeTextStyle, kOutcomeTextStyle, kHeaderTextStyle];
    var operacao = Operacao("descricao", "tipo", 0.0, DateTime.now());

    //
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          operacao.addOperacao(operacao);
          //Categoria().addCategoria("Alimentação");
        },
        label: Text('Adicionar'),
        icon: Icon(Icons.add_circle),
        backgroundColor: kSecondColor,
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Header(),
              SizedBox(
                width: double.maxFinite,
                height: 180,
                child: ListView(
                  children: [
                    CarouselSlider(
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
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Container(
                              child: Center(
                                child: Text(
                                  var1[i],
                                  style: style[i],
                                ),
                              ), //TODO: Alterar para valores do mes
                            ),
                          );
                        });
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 7.0, top: 40.0),
                      child: Text(
                        "Estabelecimentos próximos",
                        style: kTextStyle,
                      ),
                    ),
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
