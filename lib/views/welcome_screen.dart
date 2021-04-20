import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/views/login_screen.dart';

import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 110,
                  ),
                ),
                SizedBox(
                  width: 300,
                  //height: 110,
                  child: TextLiquidFill(
                    text: 'Real Spent App',
                    waveColor: kSecondColor,
                    boxBackgroundColor: kBackgroundColor,
                    loadDuration: Duration(seconds: 5),
                    boxHeight: 200.0,
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(kSecondColor, 'Entrar', () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(kSecondColor, 'Cadastrar-se', () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}
