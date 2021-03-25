import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/util/utilFirebase.dart';
import 'package:real_spent_app/constants.dart';

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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: TextLiquidFill(
            text: 'Real \$pent',
            waveColor: Colors.white,
            boxBackgroundColor: Colors.greenAccent,
            textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                fontFamily: kMainFont,
                letterSpacing: 10),
            boxHeight: 300,
          ),
        ),
      ),
    );
  }
}
