import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_spent_app/components/componente_operacao.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/globals.dart' as globals;

class ListaOperacoes extends StatefulWidget {
  @override
  _ListaOperacoesState createState() => _ListaOperacoesState();
}

class _ListaOperacoesState extends State<ListaOperacoes> {
  List<Widget> componentes = [];
  List<Operacao> listaOperacoes = [];

  preenche(String emailAtual, context) async {
    final _operacoes = FirebaseFirestore.instance.collection("operacoes");

    await for (var snapshot in _operacoes.snapshots()) {
      componentes.clear();
      listaOperacoes.clear();

      double totalEntradas = 0.0;
      double totalSaidas = 0.0;
      for (var operacao in snapshot.docs) {
        Operacao novaOperacao = Operacao.vazio();
        novaOperacao.usuario = operacao.data()['usuario'];
        novaOperacao.dataHora = operacao.data()['dataHora'];

        if (emailAtual == novaOperacao.usuario &&
            mesCorrente(novaOperacao.dataHora)) {
          novaOperacao.descricao = operacao.data()['descricao'];
          novaOperacao.tipo = operacao.data()['tipo'];
          novaOperacao.categoria = operacao.data()['categoria'];
          novaOperacao.valor = operacao.data()['valor'];

          novaOperacao.id = operacao.id;
          listaOperacoes.add(novaOperacao);

          if (novaOperacao.tipo == "Entrada") {
            totalEntradas +=
                double.parse(novaOperacao.valor.replaceAll(",", "."));
          } else if (novaOperacao.tipo == "Saída") {
            totalSaidas +=
                double.parse(novaOperacao.valor.replaceAll(",", "."));
          }
        }
      }
      setState(() {
        listaOperacoes.sort((a, b) => b.dataHora.compareTo(a.dataHora));
        globals.gTotalEntradas.value = totalEntradas;
        globals.gTotalSaidas.value = totalSaidas;
        globals.gTotal.value = totalEntradas - totalSaidas;

        print(globals.gTotalSaidas.toString() + " --Saídas - ListaOperações");
        print(
            globals.gTotalEntradas.toString() + " --Entradas - ListaOperações");

        for (var op in listaOperacoes) {
          componentes.add(componenteOperacao(
              op.descricao, op.categoria, op.valor, op.tipo, op.id, context));
        }

        // if (!globals.flag) {
        //   Navigator.pop(context);
        //   Navigator.pushNamed(context, Home_screen.id);
        //   globals.flag = true;
        // }
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
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: componentes,
    );
  }
}

bool mesCorrente(String dataHora) {
  ///EX.:2021.11.19.16.58
  ///    2021.3.22.21.47

  String mesAtual = new DateTime.now().month.toString();
  int inicio = dataHora.indexOf(".") + 1;
  String aux = dataHora.substring(inicio);
  int fim = aux.indexOf(".") + inicio;
  String mesOperacao =
      dataHora.substring(inicio, fim); //erro para meses com dois digitos

  if (mesOperacao == mesAtual) {
    return true;
  } else {
    return false;
  }
}
