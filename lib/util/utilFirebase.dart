//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/views/home_screen.dart';
import 'package:real_spent_app/views/welcome_screen.dart';

class UtilFirebase {
  static testUser(context) async {
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      Navigator.pop(context);

      Navigator.pushNamed(context, Home_screen.id);
    } else {
      Navigator.pop(context);
      Navigator.pushNamed(context, WelcomeScreen.id);
    }
  }
}
