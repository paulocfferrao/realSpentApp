import 'package:flutter/material.dart';
// import 'package:viralatacaramelo/components/ListaEstabelecimentos.dart';
// import 'package:viralatacaramelo/components/header_bar.dart';
// import 'package:viralatacaramelo/constants.dart';
// import 'package:viralatacaramelo/components/footer_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    //
    // return Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   body: SafeArea(
    //     child: LayoutBuilder(
    //         builder: (BuildContext context, BoxConstraints constraints) {
    //       return Column(
    //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           Header(),
    //           SizedBox(
    //             width: double.maxFinite,
    //             height: constraints.maxHeight -
    //                 FooterBar.footerHeight -
    //                 Header.headerHeight,
    //             child: ListView(
    //               children: [
    //                 CarouselSlider(
    //                   options: CarouselOptions(
    //                     height: 170.0,
    //                     autoPlay: true,
    //                   ),
    //                   items: [1, 2, 3, 4, 5, 6].map((i) {
    //                     return Builder(builder: (BuildContext context) {
    //                       return Container(
    //                         width: widthScreen,
    //                         margin: EdgeInsets.symmetric(horizontal: 1),
    //                         decoration: BoxDecoration(
    //                           color: kBackgroundColor,
    //                           //borderRadius: BorderRadius.all(Radius.circular(10)),
    //                           boxShadow: [
    //                             BoxShadow(
    //                               color: Colors.grey.withOpacity(0.5),
    //                               spreadRadius: 5,
    //                               blurRadius: 7,
    //                               offset: Offset(
    //                                   1, 3), // changes position of shadow
    //                             ),
    //                           ],
    //                         ),
    //                         child: Container(
    //                           child: Image.asset('images/imgCarousel$i.png'),
    //                         ),
    //                       );
    //                     });
    //                   }).toList(),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.only(left: 7.0, top: 40.0),
    //                   child: Text(
    //                     "Estabelecimentos próximos",
    //                     style: kTextStyle,
    //                   ),
    //                 ),
    //                 ListaEstabelecimentos(),
    //               ],
    //             ),
    //           ),
    //           FooterBar(),
    //         ],
    //       );
    //     }),
    //   ),
    // );
  }
}
