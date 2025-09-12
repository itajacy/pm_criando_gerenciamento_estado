import 'package:flutter_test/flutter_test.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

void main() {
  //criando um teste unitario
  group("Should teste ChangeState", () {
    test("Should increment counter", () {
      // Arrange - montar o nosso teste
      final _CounterChangeState changeState = _CounterChangeState();

      // Act - disparar a ação que queremos testar
      changeState.increment();

      // Assert - verificar se o resultado é o esperado
      // aqui esperamos que o valor do counter seja 1
      expect(changeState.counter, 1);
    });
    test("Should execute callback", () {
      // Arrange - montar o nosso teste
      bool callbackExecuted = false;
      final _CounterChangeState changeState = _CounterChangeState();
      void callback() {
        callbackExecuted = true;
      }

      // Act - disparar a ação que queremos testar
      changeState.addListener(callback);
      changeState.increment();

      // Assert - verificar se o resultado é o esperado
      // aqui esperamos que o valor do counter seja 1
      expect(changeState.counter, 1);
      expect(callbackExecuted, true);
    });


  });
}

class _CounterChangeState extends ChangeState {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallback();
  }
}
