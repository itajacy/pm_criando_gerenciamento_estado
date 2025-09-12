import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //criando um teste unitario
  group("Should teste ObservableBuilder", () {
    test("Should test increment builder", () {
      // Arrange - montar o nosso teste

      // Act - disparar a ação que queremos testar

      // Assert - verificar se o resultado é o esperado
    });
  });
}

class _CounterWidget extends StatefulWidget {
  const _CounterWidget({super.key});

  @override
  State<_CounterWidget> createState() => __CounterWidgetState();
}

class __CounterWidgetState extends State<_CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("Valor do Counter: 0");
  }
}
