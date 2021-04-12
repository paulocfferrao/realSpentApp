import 'package:flutter/material.dart';
import 'package:real_spent_app/model/Categoria.dart';
import 'package:real_spent_app/util/utilFirebase.dart';

class WaitingScreen extends StatefulWidget {
  static const String id = '/waiting';
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    UtilFirebase.testUser(context);

    super.initState();
  }

  @override
  void dispose() {
    Categoria.listaCategorias();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kSecondColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          height: 200.0,
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
