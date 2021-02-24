import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:real_spent_app/model/Categoria.dart';
import 'package:real_spent_app/model/Usuario.dart';

final operacoes = FirebaseFirestore.instance.collection("operacoes");

class Operacao {
  final String descricao;
  final String tipo; // Receita ou Despesa
  //final Categoria categoria;
  final double valor;
  final DateTime dataHora;
  //final Usuario usuario;

  Operacao(
    this.descricao,
    this.tipo,
    //this.categoria,
    this.valor,
    this.dataHora,
    // this.usuario
  );

  void addOperacao(Operacao operacao) {
    var map = operacao.toJson();
    operacoes.add(map);
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'tipo': tipo,
      //'categoria': categoria,
      'valor': valor,
      'dataHora': dataHora,
      //'usuario': usuario,
    };
  }
}
