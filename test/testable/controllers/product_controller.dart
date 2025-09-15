
import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/state_observable.dart';

import '../entitites/product.dart';
import '../states/base_state.dart';

@visibleForTesting
class ProductController extends StateObservable<BaseState> {
  // alterando o estado inicial para InitialState, passando por dentro
  // ProductController(super.state);
  ProductController() : super(InitialState());

@visibleForTesting
  void getProducts() {
    // quando iniciar a requisição, alteramos o estado para LoadingState
    state = LoadingState();
    // simulando uma requisição de rede
    state = SuccessState(
      data: [
        Product(id: 1, name: "Primeiro produto"),
        Product(id: 2, name: "Segundo produto"),
      ],
    );
  }

@visibleForTesting
  void generateError() {
    // quando iniciar a requisição, alteramos o estado para LoadingState
    state = LoadingState();
    // simulando uma requisição de rede
    try {
      throw Exception();
    } catch (e) {
      state = ErrorState(message: "Erro ao buscar produtos");
    }
  }
}
