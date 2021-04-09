import 'package:flutter/material.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/views/home_screen.dart';
import 'package:real_spent_app/views/login_screen.dart';
import 'package:real_spent_app/views/operacao_screen.dart';
import 'package:real_spent_app/views/registration_screen.dart';
import 'package:real_spent_app/views/relatorio_screen.dart';
import 'package:real_spent_app/views/waitingScreen.dart';
import 'package:real_spent_app/views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WaitingScreen.id,
      routes: {
        WaitingScreen.id: (context) => WaitingScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Home_screen.id: (context) => Home_screen(),
        OperacaoScreen.id: (context) => OperacaoScreen(),
        Relatorio_screen.id: (context) => Relatorio_screen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: kSecondColor,
          background: kBackgroundColor,
          onPrimary: kBackgroundColor,
          brightness: Brightness.light,
          onSecondary: kBackgroundColor,
          onSurface: kSecondColor,
          surface: kSecondColor,
          onError: kSecondColor,
          primaryVariant: kSecondColor,
          onBackground: kSecondColor,
          secondaryVariant: kSecondColor,
          error: Colors.redAccent,
          secondary: kSecondColor,
        ),
        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        //  primarySwatch:
        //kSecondColor,
      ),
    );
  }
}
