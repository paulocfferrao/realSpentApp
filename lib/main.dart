import 'package:flutter/material.dart';
import 'package:real_spent_app/views/home_screen.dart';
import 'package:real_spent_app/views/login_screen.dart';
import 'package:real_spent_app/views/operacao_screen.dart';
import 'package:real_spent_app/views/registration_screen.dart';
import 'package:real_spent_app/views/waitingScreen.dart';
import 'package:real_spent_app/views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WaitingScreen.id, routes: {
      WaitingScreen.id: (context) => WaitingScreen(),
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      Home_screen.id: (context) => Home_screen(),
      OperacaoScreen.id: (context) => OperacaoScreen(),
    });
  }
}
