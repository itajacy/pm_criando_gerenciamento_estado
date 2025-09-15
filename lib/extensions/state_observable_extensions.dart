import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/state_observable.dart';

extension ObservableStream<T> on StateObservable<T> {
  @visibleForTesting
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
  @visibleForTesting
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
