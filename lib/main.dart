import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mutation Test Example',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blueGrey,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.purpleAccent,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Mutation Test Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter = increment(counter);
    });
  }

  void decrementCounter() {
    if (counter == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('No puedes decrementar más allá de cero'),
            actions: <Widget>[
              FloatingActionButton(
                key: const Key('closeButton'),
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        counter = decrement(counter);
      });
    }
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final multiplicationResult = multiply(counter, 2);
    final divisionResult =
        counter > 0 ? divide(counter, 2).toStringAsFixed(1) : "0.0";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(multiplicationResult, divisionResult),
      floatingActionButton: buildFloatingActionButtons(),
    );
  }

  Center buildBody(int multiplicationResult, String divisionResult) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const SizedBox(height: 100),
            const Text('Has presionado el botón estas veces:',
                key: Key('counter-text'),
                style: TextStyle(
                  fontSize: 20,
                )),
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
        ),
      ),
    );
  }

  Row buildFloatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: resetCounter,
          tooltip: 'Reiniciar',
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: decrementCounter,
          tooltip: 'Decrementar',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: incrementCounter,
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
