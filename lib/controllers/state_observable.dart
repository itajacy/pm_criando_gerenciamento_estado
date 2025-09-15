import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pm_criando_gerenciamento_estado/contracts/observable_state.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState<T> {
  T _state;

  @override
  T get state => _state;

  set state(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyCallback();
  }

  StateObservable(this._state);
}

extension ObservableStream<T> on StateObservable<T> {
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(state); //InitialState

    void callback() {
      streamController.add(state); //LoadingState, --> SuccessState
    }

    addListener(callback);
    return streamController.stream;
  }
}

extension ObservableValueNotifier<T> on ValueNotifier<T> {
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(value); //InitialState

    void callback() {
      streamController.add(value); //LoadingState, --> SuccessState
    }

    addListener(callback);
    return streamController.stream;
  }
}
