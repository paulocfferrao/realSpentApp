import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final usuarios = FirebaseFirestore.instance.collection("usuarios");
FirebaseAuth auth = FirebaseAuth.instance;

class Usuario {
  String _nome;
  String _email;
  String _senha;

  Usuario(this._nome, this._email, this._senha);

  Usuario.vazio();

  @override
  String toString() {
    return _nome;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  void addUsuario(Usuario usuario) {
    var map = usuario.toJson();
    usuarios.add(map);
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  String emailLogado() {
    return auth.currentUser.email;
  }
}
