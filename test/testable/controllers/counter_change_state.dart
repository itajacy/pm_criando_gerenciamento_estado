import 'package:flutter/widgets.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

@visibleForTesting

class CounterChangeState extends ChangeState {
  int counter = 0;

@visibleForTesting
  void increment() {
    counter++;
    notifyCallback();
  }
}