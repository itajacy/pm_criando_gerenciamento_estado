

import 'package:flutter/material.dart';

@visibleForTesting
abstract class BaseState {}

// ou IddleState   estado inicial
class InitialState extends BaseState {}

//estado de carregamento
class LoadingState extends BaseState {}

// estado de sucesso
// normalmente temos uma variável que representa o valor do estado T
class SuccessState<T extends Object> extends BaseState {
  final T data;
  SuccessState({required this.data});
}

// estado de erro
// normalmente temos uma variável que representa a mensagem de erro
class ErrorState extends BaseState {
  final String message;
  ErrorState({required this.message});
}