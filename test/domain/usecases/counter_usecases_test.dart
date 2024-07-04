import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/domain/usecases/counter_usecases.dart';

void main() {
  group('CounterUseCase', () {
    late CounterUseCase counterUseCase;

    setUp(() {
      counterUseCase = CounterUseCase();
    });

    test('increment should increment value by 1', () {
      // Arrange
      const int value = 0;

      // Act
      final int result = counterUseCase.increment(value);

      // Assert
      expect(result, 1);
    });

    test('decrement should decrement value by 1', () {
      // Arrange
      const int value = 1;

      // Act
      final int result = counterUseCase.decrement(value);

      // Assert
      expect(result, 0);
    });

    test('multiply should multiply two values', () {
      // Arrange
      const int value1 = 2;
      const int value2 = 3;

      // Act
      final int result = counterUseCase.multiply(value1, value2);

      // Assert
      expect(result, 6);
    });

    test('divide should divide two values', () {
      // Arrange
      const int value1 = 6;
      const int value2 = 3;

      // Act
      final double result = counterUseCase.divide(value1, value2);

      // Assert
      expect(result, 2);
    });
  });
}
