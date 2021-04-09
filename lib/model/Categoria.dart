import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_spent_app/globals.dart' as globals;

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

  static void listaCategorias() async {
    globals.gCategorias.clear();

    globals.gCategorias.add("Selecione a categoria");
    await for (var snapshot in categorias.snapshots()) {
      for (var categoria in snapshot.docs) {
        globals.gCategorias.add(categoria.data()['descricao']);
      }
    }
  }

  static List<String> getCategorias() {
    //listaCategorias();
    return globals.gCategorias;
  }

  //TODO: Personalizar categoria por usuário
}
