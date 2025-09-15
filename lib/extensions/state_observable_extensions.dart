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

// tipos primitivos  com reactividade

// int
///
// 0.obs()
///

extension ReactiveInt on int {
  /// Create a reactive class from a primtive int
  ///
  /// Exanple: 0.obs()
  ///
  StateObservable<int> obs() {
    return StateObservable<int>(this);
  }
}

// double
// 0.0.obs()

extension ReactiveDouble on double {
  /// Create a reactive class from a primtive double
  ///
  /// Exanple: 1.25.obs()
  ///
  StateObservable<double> obs() {
    return StateObservable<double>(this);
  }
}

// String
// 'hello'.obs()

extension ReactiveString on String {
  /// Create a reactive class from a primtive String
  ///
  /// Exanple: "Hello".obs()
  ///
  StateObservable<String> obs() {
    return StateObservable<String>(this);
  }
}

// bool
// false.obs()

extension ReactiveBool on bool {
  /// Create a reactive class from a primtive bool
  ///
  /// Exanple: false.obs()
  ///
  StateObservable<bool> obs() {
    return StateObservable<bool>(this);
  }
}
// 