import 'package:flutter_test/flutter_test.dart';
import 'package:pm_criando_gerenciamento_estado/extensions/state_observable_extensions.dart';

void main() {
  group("Testing reactive primitives", () {
    test("Should test the reactive [int]", () {
      bool callbackExecuted = false;
      //arrange
      final observableInt = 0.obs();
      observableInt.addListener(() {
        callbackExecuted = true;
      });
      //act
      observableInt.state++;

      //assert
      expect(observableInt.state, 1);
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [double]", () {
      bool callbackExecuted = false;
      //arrange
      final observableDouble = 0.0.obs();
      observableDouble.addListener(() {
        callbackExecuted = true;
      });
      //act
      observableDouble.state += 1.25;
      //assert
      expect(observableDouble.state, 1.25);
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [string]", () {
      bool callbackExecuted = false;
      //arrange
      final observableString = 'Hello'.obs();
      observableString.addListener(() {
        callbackExecuted = true;
      });
      //act
      observableString.state += ' world';
      //assert
      expect(observableString.state, 'Hello world');
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [bool]", () {
      bool callbackExecuted = false;
      //arrange
      final observableBool = false.obs();
      observableBool.addListener(() {
        callbackExecuted = true;
      });
      //act
      observableBool.state = true;
      //assert
      expect(observableBool.state, true);
      expect(callbackExecuted, true);
    });
  });
}
