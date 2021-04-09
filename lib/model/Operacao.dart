import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_spent_app/globals.dart' as globals;

final operacoes = FirebaseFirestore.instance.collection("operacoes");

class Operacao {
  String _id;
  String _descricao;
  String _tipo; // Receita ou Despesa
  String _categoria;
  String _valor;
  String _dataHora;
  String _usuario;

  Operacao(this._descricao, this._tipo, this._categoria, this._valor,
      this._dataHora, this._usuario);

  Operacao.vazio();

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  set id(String value) {
    _id = value;
  }

  String get id => _id;

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  String get categoria => _categoria;

  set categoria(String value) {
    _categoria = value;
  }

  String get valor => _valor;

  set valor(String value) {
    _valor = value;
  }

  String get dataHora => _dataHora;

  set dataHora(String value) {
    _dataHora = value;
  }

  String get usuario => _usuario;

  set usuario(String value) {
    _usuario = value;
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': _descricao,
      'tipo': _tipo,
      'categoria': _categoria,
      'valor': _valor,
      'dataHora': _dataHora,
      'usuario': _usuario,
    };
  }

  static Operacao toObject(operacao) {
    Operacao novaOperacao = Operacao.vazio();
    novaOperacao.usuario = operacao.data()['usuario'];
    novaOperacao.dataHora = operacao.data()['dataHora'];
    novaOperacao.descricao = operacao.data()['descricao'];
    novaOperacao.tipo = operacao.data()['tipo'];
    novaOperacao.categoria = operacao.data()['categoria'];
    novaOperacao.valor = operacao.data()['valor'];
    novaOperacao.id = operacao.id;
    return novaOperacao;
  }

  void addOperacao(Operacao operacao) {
    var map = operacao.toJson();
    operacoes.add(map);
  }

  static deletarOperacao(String id) async {
    operacoes.doc(id).delete();
  }

  static editarOperacao(String id, operacao) async {
    var map = operacao.toJson();
    operacoes.doc(id).update(map);
  }
}
//todo: função para retornar lista de operações
