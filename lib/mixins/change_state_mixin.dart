import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

import '../controllers/state_observable.dart';
// o mixin é uma classe que pode ser "misturada" em outras classes
// para adicionar funcionalidades a essas classes
// o mixin não pode ser instanciado, ou seja, não pode criar objetos
// da classe mixin

// a ideia da reatividade é poder adicionar e remover escutadores
// de forma dinâmica, ou seja, quando o estado mudar, todos os
// escutadores serão notificados

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState) {
    changeState.addListener(_callback);
    _changeStates.add(changeState);
  }

  void _callback() {
    // se o widget ainda estiver montado, ou seja, na árvore de widgets
    // então chama o setState para atualizar a interface
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    // percorre a lista de ChangeState e remove o listener
    for (var element in _changeStates) {
      element.removeListener(_callback);
    }

    super.dispose();
  }

  StateObservable<T> useStateObservable<T>(T state) {
    final stateObservable = StateObservable<T>(state);
    stateObservable.addListener(_callback);
    _changeStates.add(stateObservable);
    return stateObservable;
  }
}
