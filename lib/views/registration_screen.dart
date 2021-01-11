// import 'package:viralatacaramelo/components/inputDefault.dart';
// import 'package:viralatacaramelo/constants.dart';
import 'package:flutter/material.dart';
// import 'package:viralatacaramelo/components/rounded_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:viralatacaramelo/util/dialogs.dart';
// import 'package:viralatacaramelo/views/home_screen.dart';
// import 'package:viralatacaramelo/model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  bool visibilityBasic = false;
  bool visibilityAddress = false;

  // final _auth = FirebaseAuth.instance;
  // final usuarios = FirebaseFirestore.instance.collection("usuarios");
  // Usuario usuario = Usuario.vazio();

  @override
  void initState() {
    visibilityBasic = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   body: ModalProgressHUD(
    //     inAsyncCall: showSpinner,
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 24.0),
    //       child: ListView(
    //         children: [
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: <Widget>[
    //               Hero(
    //                 tag: 'logo',
    //                 child: Container(
    //                   height: 200.0,
    //                   child: Image.asset('images/logo.png'),
    //                 ),
    //               ),
    //               Visibility(
    //                 //Básico
    //                 visible: visibilityBasic,
    //                 child: Column(
    //                   children: [
    //                     SizedBox(
    //                       height: 48.0,
    //                     ),
    //                     inputDefault.inputDefault(
    //                         usuario: usuario, field: "Digite seu nome"), //Nome
    //                     SizedBox(
    //                       height: kMarginInput,
    //                     ),
    //                     inputDefault.inputDefault(
    //                         usuario: usuario,
    //                         field: "Digite seu e-mail",
    //                         textInputType: TextInputType.emailAddress),
    //
    //                     SizedBox(
    //                       height: kMarginInput,
    //                     ),
    //                     inputDefault.inputDefault(
    //                         usuario: usuario,
    //                         field: "Crie uma senha",
    //                         obscureText: true),
    //
    //                     SizedBox(
    //                       height: kMarginInput,
    //                     ),
    //                     RoundedButton(kSecondColor, "Avançar", () async {
    //                       setState(() {
    //                         visibilityAddress = true;
    //                         visibilityBasic = false;
    //                       });
    //                     })
    //                   ],
    //                 ),
    //               ),
    //               Visibility(
    //                 //Endereço
    //                 visible: visibilityAddress,
    //                 child: Column(
    //                   children: [
    //                     inputDefault.inputDefault(
    //                         usuario: usuario,
    //                         field: "CEP",
    //                         textInputType: TextInputType.number),
    //                     inputDefault.inputDefault(
    //                       usuario: usuario,
    //                       field: "Rua",
    //                     ),
    //                     inputDefault.inputDefault(
    //                       usuario: usuario,
    //                       field: "Número",
    //                     ),
    //                     inputDefault.inputDefault(
    //                       usuario: usuario,
    //                       field: "Complemento",
    //                     ),
    //                     inputDefault.inputDefault(
    //                       usuario: usuario,
    //                       field: "Bairro",
    //                     ),
    //                     RoundedButton(kSecondColor, 'Cadastrar', () async {
    //                       setState(() {
    //                         showSpinner = true;
    //                       });
    //                       try {
    //                         final newUser =
    //                             await _auth.createUserWithEmailAndPassword(
    //                                 email: usuario.email,
    //                                 password: usuario.senha);
    //
    //                         if (newUser != null) {
    //                           usuarios.add({
    //                             'nome': usuario.nome,
    //                             'email': usuario.email,
    //                             'endereco': usuario.endereco,
    //                             'numero': usuario.numero,
    //                             'cep': usuario.cep,
    //                             'complemento': usuario.complemento,
    //                             'bairro': usuario.bairro,
    //                           });
    //
    //                           Navigator.pushNamed(context, Home_screen.id);
    //                         } else {
    //                           setState(() {
    //                             showSpinner = false;
    //                           });
    //                           AlertasUteis().alertaSimples(
    //                               context,
    //                               "Erro!",
    //                               "Por favor tente novamente",
    //                               "Verifique sua conexão com a internet!");
    //                         }
    //                       } on Exception catch (e) {
    //                         print(e);
    //                         setState(() {
    //                           showSpinner = false;
    //                         });
    //                         AlertasUteis().alertaSimples(
    //                             context,
    //                             "Erro!",
    //                             "Por favor tente novamente",
    //                             "Verifique sua conexão com a internet!");
    //                       }
    //                     }),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
