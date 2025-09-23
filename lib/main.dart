
import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/contracts/stream_notifier_builder.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/stream_notifier_imp.dart';

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
  final _counterNotifier = StreamNotifier(0);



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testando Streams"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamNotifierBuilder(
              listen: (context, state) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('O valor emitido $state'),
                    // duration: const Duration(milliseconds: 500),
                  ),
                );
              },
              // buildWhen: (previous, current) {
              //   print('previous: $previous, current: $current');
              //   return current % 2 == 0;
              // },
              streamNotifier: _counterNotifier,
              builder: (context, state) {
                return Text(
                  'Valor do counter: ${_counterNotifier.state}',
                );
              }
            ),
            ElevatedButton(
              onPressed: () {
                _counterNotifier.emit(_counterNotifier.state + 1);
              },
              child: const Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
