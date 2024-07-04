import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        final counter = counterProvider.counter;
        final multiplicationResult = counterProvider.multiplicationResult;
        final divisionResult = counterProvider.divisionResult;

        return Column(
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              'Contador multiplicado por 2: $multiplicationResult',
              style: const TextStyle(
                color: Colors.cyan,
                fontSize: 20,
              ),
            ),
            Text(
              'Contador dividido por 2: $divisionResult',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
