import 'package:flutter/material.dart';

import '../../domain/usecases/counter_usecases.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  final CounterUseCase _counterUseCase = CounterUseCase();

  int get counter => _counter;

  void increment() {
    _counter = _counterUseCase.increment(_counter);
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter = _counterUseCase.decrement(_counter);
    }
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  int get multiplicationResult => _counterUseCase.multiply(_counter, 2);

  String get divisionResult =>
      _counter > 0 ? _counterUseCase.divide(_counter, 2).toStringAsFixed(1) : "0.0";
}
