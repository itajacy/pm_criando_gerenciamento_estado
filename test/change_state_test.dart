import 'package:flutter_test/flutter_test.dart';

import 'testable/controllers/counter_change_state.dart';

void main() {
  //criando um teste unitario
  group("Should teste ChangeState", () {
    test("Should increment counter", () {
      // Arrange - montar o nosso teste
      final CounterChangeState changeState = CounterChangeState();

      // Act - disparar a ação que queremos testar
      changeState.increment();

      // Assert - verificar se o resultado é o esperado
      // aqui esperamos que o valor do counter seja 1
      expect(changeState.counter, 1);
    });
    test("Should execute callback", () {
      // Arrange - montar o nosso teste
      bool callbackExecuted = false;
      final CounterChangeState changeState = CounterChangeState();
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


