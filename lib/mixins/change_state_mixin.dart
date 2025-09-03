import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';
// o mixin é uma classe que pode ser "misturada" em outras classes
// para adicionar funcionalidades a essas classes
// o mixin não pode ser instanciado, ou seja, não pode criar objetos
// da classe mixin

// a ideia da reatividade é poder adicionar e remover escutadores
// de forma dinâmica, ou seja, quando o estado mudar, todos os
// escutadores serão notificados

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  late ChangeState? _changeState;

  void useChangeState(ChangeState changeState) {
    changeState.addListener(_callback);
    _changeState = changeState;
  }

  void _callback() {
    setState(() {});
  }

  @override
  void dispose() {
    if (_changeState != null) _changeState?.removeListener(_callback);
    super.dispose();
  }
}
