import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

//Cor de fundo
const kBackgroundColor = Colors.white; //Color(0xFFF2B705);

//Segunda cor é usada em botões e outros detalhes
//const kSecondColor = Color(0xFF1BD9C4);

const kSecondColor = Color(0xFF8C0078);

const double kMarginInput = 8.0;
//const kMessageContainerDecoration = BoxDecoration(
//  border: Border(
//    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//  ),
//);

const kSendButtonTextStyle = TextStyle(
  color: kSecondColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kOptionsTextStyle = TextStyle(
  fontFamily: kMainFont,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
var kTextMoeda = MoneyMaskedTextController(decimalSeparator: ",", precision: 2);

var kShowDateFormat = DateFormat('dd/MM/yyyy');
//todo dbDateFormat
const kTextStyle = TextStyle(
  fontFamily: kMainFont,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const String kMainFont = 'Raleway';

const kHeaderTextStyle = TextStyle(
  color: kSecondColor,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  fontFamily: kMainFont,
);
const kOutcomeTextStyle = TextStyle(
  color: Colors.redAccent,
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
  fontFamily: kMainFont,
);
const kIncomeTextStyle = TextStyle(
  color: Colors.greenAccent,
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
  fontFamily: kMainFont,
);
const kInTextStyle = TextStyle(
  color: Colors.greenAccent,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: kMainFont,
);

const kInputDecoration = InputDecoration(
//  filled: false,
//  fillColor: Colors.white,

  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
