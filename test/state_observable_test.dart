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

    test("Should execute StateObservable callback when we increment counter", (){
      // Arrange
      bool isCallbackExecuted = false;
      final counterState = StateObservable<int>(0);

      // Act
      void callback(){
        isCallbackExecuted = true;
      }

      counterState.addListener(callback);
      counterState.state++;

      // Assert
      expect(isCallbackExecuted, true);
    });
  });
}
