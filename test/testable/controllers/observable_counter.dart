import 'package:flutter/widgets.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

@visibleForTesting
class ObservableCounter extends ChangeState {
  int count = 0;

@visibleForTesting
  void increment() {
    count++;
    notifyCallback();
  }
}
