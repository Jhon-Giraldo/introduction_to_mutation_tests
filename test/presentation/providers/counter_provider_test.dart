import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/presentation/providers/counter_provider.dart';

void main() {
  group('CounterProvider', () {
    late CounterProvider counterProvider;

    setUp(() {
      counterProvider = CounterProvider();
    });

    test('increment should increment counter', () {
      // Act
      counterProvider.increment();

      // Assert
      expect(counterProvider.counter, 1);
    });

    test('decrement should decrement counter', () {
      // Arrange
      counterProvider.increment();

      // Act
      counterProvider.decrement();

      // Assert
      expect(counterProvider.counter, 0);
    });

    test('reset should reset counter to 0', () {
      // Arrange
      counterProvider.increment();

      // Act
      counterProvider.reset();

      // Assert
      expect(counterProvider.counter, 0);
    });

    test('multiplicationResult should return counter multiplied by 2', () {
      // Arrange
      counterProvider.increment();
      counterProvider.increment();

      // Act
      final result = counterProvider.multiplicationResult;

      // Assert
      expect(result, 4);
    });

    test('divisionResult should return counter divided by 2', () {
      // Arrange
      counterProvider.increment();
      counterProvider.increment();

      // Act
      final result = counterProvider.divisionResult;

      // Assert
      expect(result, '1.0');
    });
  });
}
