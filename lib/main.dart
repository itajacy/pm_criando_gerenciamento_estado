import 'package:flutter/material.dart';
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
  void initState() {
    _counterNotifier.stream.listen(
      (newState) {
        setState(() {});
      },
    );
    
    super.initState();
  }

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
            Text(
              'Valor do counter: ${_counterNotifier.state}',
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
