import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_spent_app/components/componente_operacao.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';

class ListaOperacoes extends StatefulWidget {
  @override
  _ListaOperacoesState createState() => _ListaOperacoesState();
}

class _ListaOperacoesState extends State<ListaOperacoes> {
  List<Widget> componentes = [];
  List<Operacao> listaOperacoes = [];
  preenche(String emailAtual, context) async {
    componentes.clear();
    listaOperacoes.clear();
    final _operacoes = FirebaseFirestore.instance.collection("operacoes");

    await for (var snapshot in _operacoes.snapshots()) {
      for (var operacao in snapshot.docs) {
        Operacao novaOperacao = Operacao.vazio();
        novaOperacao.usuario = operacao.data()['usuario'];

        if (emailAtual == novaOperacao.usuario) {
          novaOperacao.descricao = operacao.data()['descricao'];
          novaOperacao.tipo = operacao.data()['tipo'];
          novaOperacao.categoria = operacao.data()['categoria'];
          novaOperacao.valor = operacao.data()['valor'];
          novaOperacao.dataHora = operacao.data()['dataHora'];
          novaOperacao.id = operacao.id;
          listaOperacoes.add(novaOperacao);
        }

        //print(estabelecimento.data());
      }
      setState(() {
        listaOperacoes.sort((a, b) => b.dataHora.compareTo(a.dataHora));

        setState(() {
          for (var op in listaOperacoes) {
            componentes.add(componenteOperacao(
                op.descricao, op.categoria, op.valor, op.tipo, op.id, context));
          }
        });

        //TODO: Limitar operações do mes
      });
    }
  }

  @override
  void initState() {
    preenche(auth.currentUser.email, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //preenche(auth.currentUser.email, context);
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: componentes,
    );
  }
}
