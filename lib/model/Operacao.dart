import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_spent_app/model/Usuario.dart';

final operacoes = FirebaseFirestore.instance.collection("operacoes");

class Operacao {
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

  void addOperacao(Operacao operacao) {
    var map = operacao.toJson();
    operacoes.add(map);
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

//TODO: criar função buscaOpereaçoes() para retornar operações do usuário logado
  //TODO: Criar funções para calcular total do mês, entradas e saídas

  List<Operacao> operacoesAux = [];

  List<Operacao> listaOperacoes(emailAtual) {
    buscaOpereacoes(emailAtual);
    return operacoesAux;
  }

  buscaOpereacoes(emailAtual) async {
    final _operacoes = FirebaseFirestore.instance.collection("operacoes");

    await for (var snapshot in _operacoes.snapshots()) {
      for (var operacao in snapshot.docs) {
        Operacao novaOperacao;
        novaOperacao.usuario = operacao.data()['usuario'];
        if (emailAtual == novaOperacao.usuario) {
          novaOperacao.descricao = operacao.data()['descricao'];
          novaOperacao.tipo = operacao.data()['tipo'];
          novaOperacao.categoria = operacao.data()['categoria'];
          novaOperacao.valor = operacao.data()['valor'];
          novaOperacao.dataHora = operacao.data()['dataHora'];

          operacoesAux.add(novaOperacao);
        }
      }
    }
  }
}
