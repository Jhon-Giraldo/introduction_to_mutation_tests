class CounterUseCase {
  int increment(int value) => value + 1;

  int decrement(int value) => value > 0 ? value - 1 : 0;

  int multiply(int value1, int value2) => value1 * value2;

  double divide(int value1, int value2) {
    if (value2 != 0) {
      return (value1 / value2).toDouble();
    } else {
      throw Exception('No se puede dividir por cero');
    }
  }
}
