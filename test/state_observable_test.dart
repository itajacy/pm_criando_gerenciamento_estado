// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pm_criando_gerenciamento_estado/controllers/state_observable.dart';

void main() {
  group("Should test StateObservable", () {
    test("Should update state correctly when we increment counter", () {
      // Arrange
      final counterState = StateObservable<int>(0);

      // Act
      counterState.state++;

      // Assert
      expect(counterState.state, 1);
    });

    test(
      "Should execute StateObservable callback when we increment counter",
      () {
        // Arrange
        bool isCallbackExecuted = false;
        final counterState = StateObservable<int>(0);

        // Act
        void callback() {
          isCallbackExecuted = true;
        }

        counterState.addListener(callback);
        counterState.state++;

        // Assert
        expect(isCallbackExecuted, true);
      },
    );
  });
  test("Should generate SuccessState when we call (getProducts)", () {
    // Arrange
    final productController = ProductController();
    expect(productController.state, isA<InitialState>());
    // Act
    productController.getProducts();

    // Assert
    // isA<> verifica se o tipo é do tipo SuccessState
    expect(productController.state, isA<SuccessState>());
  });

  test("Should generate states in sequence", () {
    final productController = ProductController();
    expect(
      productController.asStream(),
      emitsInOrder([
        isInstanceOf<InitialState>(),
        isInstanceOf<LoadingState>(),
        isInstanceOf<SuccessState<List<Product>>>(),
      ]),
    );
    productController.getProducts();
  });
  test("Should generate states in sequence when we get error", () {
    final productController = ProductController();
    expect(
      productController.asStream(),
      emitsInOrder([
        isInstanceOf<InitialState>(),
        isInstanceOf<LoadingState>(),
        isInstanceOf<ErrorState>(),
      ]),
    );
    productController.generateError();
  });
  test("Should generate states in sequence when we get error2", () {
    final productController = ProductController();
    expect(
      productController.asStream(),
      emitsInOrder([
        isInstanceOf<InitialState>(),
        isInstanceOf<LoadingState>(),
        isInstanceOf<SuccessState>(),
        isInstanceOf<LoadingState>(),
        isInstanceOf<ErrorState>(),
      ]),
    );
    productController.getProducts();
    productController.generateError();
  });

  test("Testing ValueNotifier", () {
    final valueNotifier = ValueNotifier<int>(0); //0

    expect(valueNotifier.asStream(), emitsInOrder([0, 1, 2]));

    valueNotifier.value++; //1
    valueNotifier.value++; //2
  });

}

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

class Product {
  final int id;
  final String name;
  Product({
    required this.id,
    required this.name,
  });
}

class ProductController extends StateObservable<BaseState> {
  // alterando o estado inicial para InitialState, passando por dentro
  // ProductController(super.state);
  ProductController() : super(InitialState());

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
