import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/builders/observable_builder.dart';
import 'package:pm_criando_gerenciamento_estado/builders/observable_state_builder.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/state_observable.dart';

import 'classes/counter_state.dart';

///O callback é uma função que é passada como argumento para outra função
///e é executada em um determinado ponto do tempo.
/// O callback é afunção que está no main e que contém o setState
///
/// É na instância de CounterState que o callback é registrado como ouvinte.
/// portanto quando houver uma mudança no estado, o callback será chamado.
///
/// Isso garante que a interface do usuário seja atualizada sempre que o estado mudar.
///
///  É na instância de CounterState que  foi adicionada um ouvinte (addListener)
/// portanto quando houver uma alteraçao e uma NOTIFICAÇÃO, dentro da
/// Notificação é executada o callback e como dentro do Main existe um setState que está dentro
/// de um stateful a tela é atualizada

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final observableCounter = StateObservable<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerenciamento de estado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ObservableStateBuilder(
              stateObservable: observableCounter,
              builder: (context, state, child) {
                return Text(
                  'Valor do observableCounter: $state',
                  // style: const TextStyle(fontSize: 20),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                observableCounter.state++;
              },
              child: Text("incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
