
import 'package:pm_criando_gerenciamento_estado/contracts/observable.dart';

class ChangeState implements Observable {
  final List<void Function()> _callbacks = [];

  @override
  void addListener(void Function() callback) {
    // verifica se existe na lista
    // se não existir, adiciona na lista
    if (!_callbacks.contains(callback)) _callbacks.add(callback);
  }

  @override
  void removeListener(void Function() callback) {
    // verifica se existe na lista
    // se existir, remove da lista
    if (_callbacks.contains(callback)) _callbacks.remove(callback);
  }

  void notifyCallback() {
    for (int i = 0; i < _callbacks.length; i++) {
      // executando a função para atualizar o estado
      // _callbacks[i]();
      // ou assim:
      _callbacks[i].call();
    }
  }
}
