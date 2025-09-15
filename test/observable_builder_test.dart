import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'testable/widgets/counter_widget.dart';


void main() {
  //criando um teste unitario
  group("Should teste ObservableBuilder", () {
    testWidgets("Should test increment builder", (widgetTests) async {
      await widgetTests.pumpWidget(MaterialApp(home: const CounterWidget()));

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





