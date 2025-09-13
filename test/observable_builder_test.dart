import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/builders/observable_builder.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

void main() {
  //criando um teste unitario
  group("Should teste ObservableBuilder", () {
    testWidgets("Should test increment builder", (widgetTests) async {
      await widgetTests.pumpWidget(MaterialApp(home: const _CounterWidget()));

      final findText = find.text("Valor do Counter: 0");

      final findButton = find.byKey(const Key(incrementButtonKey));

      expect(findText, findsOneWidget);

      expect(findButton, findsOneWidget);

      await widgetTests.tap(findButton);
      // atualiza a tela
      await widgetTests.pump();

      final nextCounterText = find.text("Valor do Counter: 1");

      expect(nextCounterText, findsOneWidget);
    });
  });
}

const incrementButtonKey = "increment_key";

class _CounterWidget extends StatefulWidget {
  const _CounterWidget();

  @override
  State<_CounterWidget> createState() => __CounterWidgetState();
}

class __CounterWidgetState extends State<_CounterWidget> {
  final _counter = _ObservableCounter();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ObservableBuilder(
          observable: _counter,
          builder: (context, child) {
            return Text("Valor do Counter: ${_counter.count}");
          },
        ),
        ElevatedButton(
          key: Key(incrementButtonKey),
          onPressed: () {
            _counter.increment();
          },
          child: const Text('Incrementar '),
        ),
      ],
    );
  }
}

class _ObservableCounter extends ChangeState {
  int count = 0;

  void increment() {
    count++;
    notifyCallback();
  }
}
