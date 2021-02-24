import 'package:cloud_firestore/cloud_firestore.dart';

final categorias = FirebaseFirestore.instance.collection("categorias");

class Categoria {
  //String _descricao;

  Categoria();

  void addCategoria(String descricao) {
    if (descricao == "") {
      descricao = "Teste";
    }
    categorias.add({
      'descricao': descricao,
    });
  }
  //TODO: Personalizar categoria por usuário
}
