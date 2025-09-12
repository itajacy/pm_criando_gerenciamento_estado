import 'package:flutter_test/flutter_test.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

void main() {

  //criando um teste unitario
  test("Should teste ChangeState", () {
    final _CounterChangeState changeState = _CounterChangeState();
    changeState.increment();

    // aqui esperamos que o valor do counter seja 1
    expect(changeState.counter, 1);
  });
}

class _CounterChangeState extends ChangeState {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallback();
  }
}
