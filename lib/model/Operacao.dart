import 'package:cloud_firestore/cloud_firestore.dart';

final operacoes = FirebaseFirestore.instance.collection("operacoes");

class Operacao {
  final String descricao;
  final String tipo; // Receita ou Despesa
  final String categoria;
  final double valor;
  final DateTime dataHora;
  final String usuario;

  Operacao(this.descricao, this.tipo, this.categoria, this.valor, this.dataHora,
      this.usuario);

  void addOperacao(Operacao operacao) {
    var map = operacao.toJson();
    operacoes.add(map);
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'tipo': tipo,
      'categoria': categoria,
      'valor': valor,
      'dataHora': dataHora,
      'usuario': usuario,
    };
  }

  //TODO: criar função buscaOpereaçoes() para retornar operações do usuário logado
  //TODO: Criar funções para calcular total do mês, entradas e saídas
}
