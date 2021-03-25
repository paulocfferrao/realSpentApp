import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:real_spent_app/components/rounded_button.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/util/utilFirebase.dart';
import 'package:real_spent_app/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;
  // String email;
  // String password;
  Usuario usuario = Usuario.vazio();
  // @override
  // void initState() {
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      usuario.email = value;
                    },
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Digite seu email'),
                  ),
                  SizedBox(
                    height: kMarginInput,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      usuario.senha = value;
                    },
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Digite sua senha'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(kSecondColor, 'Entrar', () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: usuario.email, password: usuario.senha);

                      if (user != null) {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.pushNamed(context, Home_screen.id);
                        //UtilFirebase.testUser(context);
                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, Home_screen.id);
                      } else {
                        setState(() {
                          showSpinner = false;
                        });
                        // AlertasUteis().alertaSimples(
                        //     context,
                        //     "Atenção",
                        //     "Usuário ou senha incorretos",
                        //     "Por favor tente novamente");
                      }
                    } on Exception catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      //todo: AlertasUteis().alertaSimples( -> Utilizado em excluir
                      //     context,
                      //     "Atenção",
                      //     "Usuário ou senha incorretos",
                      //     "Por favor tente novamente");
                      print(e);
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
