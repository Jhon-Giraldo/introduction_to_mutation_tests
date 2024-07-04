import 'package:flutter/material.dart';

import '../widgets/counter_buttons.dart';
import '../widgets/counter_display.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const CounterBody(),
      floatingActionButton: const CounterButtons(),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 150),
            SizedBox(height: 100),
            Text(
              'Has presionado el botón estas veces:',
              key: Key('counter-text'),
              style: TextStyle(fontSize: 20),
            ),
            CounterDisplay(),
          ],
        ),
      ),
    );
  }
}
