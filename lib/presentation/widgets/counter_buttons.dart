import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';
import 'error_dialog.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: counterProvider.reset,
          tooltip: 'Reiniciar',
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            if (counterProvider.counter == 0) {
              showErrorDialog(
                  context, 'No puedes decrementar más allá de cero');
            } else {
              counterProvider.decrement();
            }
          },
          tooltip: 'Decrementar',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: counterProvider.increment,
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
