import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_spent_app/components/componente_operacao.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/globals.dart' as globals;
import 'package:real_spent_app/util/funcoes.dart';

class ListaOperacoes extends StatefulWidget {
  @override
  _ListaOperacoesState createState() => _ListaOperacoesState();
}

class _ListaOperacoesState extends State<ListaOperacoes> {
  List<Widget> componentes = [];
  List<Operacao> listaOperacoes = [];

  preenche(context) async {
    final DateTime data = DateTime.now();
    final int ultimoDia = getLastDay(data.month, data.year);
    final DateTime dtInicial = DateTime(data.year, data.month);
    final DateTime dtFinal = DateTime(data.year, data.month, ultimoDia);
    listaOperacoes = await Operacao.getOperacoes(dtInicial, dtFinal, "");

    setState(() {
      listaOperacoes.sort((a, b) => b.dataHora.compareTo(a.dataHora));
      var _totalEntradas = 0.0;
      var _totalSaidas = 0.0;
      for (var op in listaOperacoes) {
        if (op.tipo == "Entrada") {
          _totalEntradas += double.parse(op.valor.replaceAll(",", "."));
        } else if (op.tipo == "Saída") {
          _totalSaidas += double.parse(op.valor.replaceAll(",", "."));
        }
      }

      globals.gTotalEntradas.value = _totalEntradas;
      globals.gTotalSaidas.value = _totalSaidas;
      globals.gTotal.value = _totalEntradas - _totalSaidas;

      for (var op in listaOperacoes) {
        componentes.add(componenteOperacao(
            op.descricao, op.categoria, op.valor, op.tipo, op.id, context));
      }
    });
  }

  // preenche(String emailAtual, context) async {
  //   final _operacoes = FirebaseFirestore.instance.collection("operacoes");
  //
  //   await for (var snapshot in _operacoes.snapshots()) {
  //     componentes.clear();
  //     listaOperacoes.clear();
  //
  //     double totalEntradas = 0.0;
  //     double totalSaidas = 0.0;
  //     for (var operacao in snapshot.docs) {
  //       Operacao novaOperacao = Operacao.vazio();
  //       novaOperacao.usuario = operacao.data()['usuario'];
  //       novaOperacao.dataHora = operacao.data()['dataHora'];
  //
  //       if (emailAtual == novaOperacao.usuario &&
  //           mesCorrente(novaOperacao.dataHora)) {
  //         novaOperacao.descricao = operacao.data()['descricao'];
  //         novaOperacao.tipo = operacao.data()['tipo'];
  //         novaOperacao.categoria = operacao.data()['categoria'];
  //         novaOperacao.valor = operacao.data()['valor'];
  //
  //         novaOperacao.id = operacao.id;
  //         listaOperacoes.add(novaOperacao);
  //
  //         if (novaOperacao.tipo == "Entrada") {
  //           totalEntradas +=
  //               double.parse(novaOperacao.valor.replaceAll(",", "."));
  //         } else if (novaOperacao.tipo == "Saída") {
  //           totalSaidas +=
  //               double.parse(novaOperacao.valor.replaceAll(",", "."));
  //         }
  //       }
  //     }
  //     setState(() {
  //       listaOperacoes.sort((a, b) => b.dataHora.compareTo(a.dataHora));
  //       globals.gTotalEntradas.value = totalEntradas;
  //       globals.gTotalSaidas.value = totalSaidas;
  //       globals.gTotal.value = totalEntradas - totalSaidas;
  //
  //       for (var op in listaOperacoes) {
  //         componentes.add(componenteOperacao(
  //             op.descricao, op.categoria, op.valor, op.tipo, op.id, context));
  //       }
  //     });
  //   }
  // }

  @override
  void initState() {
    preenche(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: componentes,
    );
  }
}
