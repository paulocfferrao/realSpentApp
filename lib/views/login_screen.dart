// import 'package:viralatacaramelo/constants.dart';
import 'package:flutter/material.dart';
// import 'package:viralatacaramelo/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:viralatacaramelo/util/dialogs.dart';
// import 'package:viralatacaramelo/util/utilFirebase.dart';
// import 'package:viralatacaramelo/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String email;
  String password;

  // @override
  // void initState() {
  //
  //   super.initState();
  // }

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
    //               SizedBox(
    //                 height: 48.0,
    //               ),
    //               TextField(
    //                 keyboardType: TextInputType.emailAddress,
    //                 textAlign: TextAlign.center,
    //                 onChanged: (value) {
    //                   email = value;
    //                 },
    //                 decoration:
    //                     kInputDecoration.copyWith(hintText: 'Digite seu email'),
    //               ),
    //               SizedBox(
    //                 height: kMarginInput,
    //               ),
    //               TextField(
    //                 obscureText: true,
    //                 textAlign: TextAlign.center,
    //                 onChanged: (value) {
    //                   password = value;
    //                 },
    //                 decoration:
    //                     kInputDecoration.copyWith(hintText: 'Digite sua senha'),
    //               ),
    //               SizedBox(
    //                 height: 24.0,
    //               ),
    //               RoundedButton(kSecondColor, 'Entrar', () async {
    //                 setState(() {
    //                   showSpinner = true;
    //                 });
    //                 try {
    //                   final user = await _auth.signInWithEmailAndPassword(
    //                       email: email, password: password);
    //
    //                   if (user != null) {
    //                     UtilFirebase().testUser(context);
    //                     // Navigator.pop(context);
    //                     // Navigator.pushNamed(context, Home_screen.id);
    //                   } else {
    //                     setState(() {
    //                       showSpinner = false;
    //                     });
    //                     AlertasUteis().alertaSimples(
    //                         context,
    //                         "Atenção",
    //                         "Usuário ou senha incorretos",
    //                         "Por favor tente novamente");
    //                   }
    //                 } on Exception catch (e) {
    //                   setState(() {
    //                     showSpinner = false;
    //                   });
    //                   AlertasUteis().alertaSimples(
    //                       context,
    //                       "Atenção",
    //                       "Usuário ou senha incorretos",
    //                       "Por favor tente novamente");
    //                   print(e);
    //                 }
    //               }),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
