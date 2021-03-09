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
  preenche(String emailAtual) async {
    final _operacoes = FirebaseFirestore.instance.collection("operacoes");

    await for (var snapshot in _operacoes.snapshots()) {
      for (var operacao in snapshot.docs) {
        //Operacao novaOperacao = Operacao.vazio();
        var usuario = operacao.data()['usuario'];

        if (emailAtual == usuario) {
          var descricao = operacao.data()['descricao'];
          var tipo = operacao.data()['tipo'];
          var categoria = operacao.data()['categoria'];
          var valor = operacao.data()['valor'];
          var dataHora = operacao.data()['dataHora'];

          setState(() {
            componentes
                .add(componenteOperacao(descricao, categoria, valor, tipo));
            //TODO: Listar por data
          });
        }

        //print(estabelecimento.data());
      }
    }
  }

  @override
  void initState() {
    preenche(auth.currentUser.email);
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
