import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_spent_app/components/ListaOperacoes.dart';
import 'package:real_spent_app/views/home_screen.dart';
import 'package:real_spent_app/views/welcome_screen.dart';
import 'package:real_spent_app/globals.dart' as globals;

class UtilFirebase {
  testUser(context) async {
    await Firebase.initializeApp();
    // if(!globals.flag){
    //   ListaOperacoes();//todo: atualizar o valor de globals.teste antes de carregar a home
    // }

    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      Navigator.pop(context);

      Navigator.pushNamed(context, Home_screen.id);
    } else {
      Navigator.pop(context);
      Navigator.pushNamed(context, WelcomeScreen.id);
    }
  }

  Future<bool> verificaEstabelecimento() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final _estabelecimentos =
        FirebaseFirestore.instance.collection("estabelecimentos");

    await for (var snapshot in _estabelecimentos.snapshots()) {
      for (var estabelecimento in snapshot.docs) {
        var _email = estabelecimento.data()['email'];
        if (_email != null) {
          if (auth.currentUser.email == _email) {
            return true;
          }
        }
      }
      return false;
    }
  }

  getCnpj() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final _estabelecimentos =
        FirebaseFirestore.instance.collection("estabelecimentos");

    await for (var snapshot in _estabelecimentos.snapshots()) {
      for (var estabelecimento in snapshot.docs) {
        var _email = estabelecimento.data()['email'];

        if (auth.currentUser.email == _email) {
          return estabelecimento.data()['cnpj'];
        }
      }
    }
  }
  //

  // String _urlImage;
  // Future<String> getUrl(cnpj) async {
  //   print(rt);
  //   return rt; //
  //
  //   //return "https://firebasestorage.googleapis.com/v0/b/viralatacaramelo-59646.appspot.com/o/9784649164646.profileImage.jpg?alt=media&token=6817a9b0-751e-46f6-9709-5f0fe15cb577";
  // }

  // estabelecimentoStream() async {
  //
  //   return cards;
  // }

  // getCards() async {
  //   await _estabelecimentoStream();
  //   return _cards;
  // }

  // gravaArquivo() {
  //   final FirebaseStorage storage = FirebaseStorage(
  //       storageBucket:
  //           'gs://viralatacaramelo-59646.appspot.com/AvatarEstabelecimentos');
  // }
}
