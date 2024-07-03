import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/main.dart';

void main() {
  group('MyHomePageState', () {
    late MyHomePageState myHomePageState;

    setUp(() {
      myHomePageState = MyHomePageState();
    });

    test('increment should increment value by 1', () {
      // Arrange
      const int value = 0;

      // Act
      final int result = myHomePageState.increment(value);

      // Assert
      expect(result, 1);
    });

    test('decrement should decrement value by 1', () {
      // Arrange
      const int value = 1;

      // Act
      final int result = myHomePageState.decrement(value);

      // Assert
      expect(result, 0);
    });

    test('multiply should multiply two values', () {
      // Arrange
      const int value1 = 2;
      const int value2 = 3;

      // Act
      final int result = myHomePageState.multiply(value1, value2);

      // Assert
      expect(result, 6);
    });

    test('divide should divide two values', () {
      // Arrange
      const int value1 = 6;
      const int value2 = 3;

      // Act
      final double result = myHomePageState.divide(value1, value2);

      // Assert
      expect(result, 2);
    });
  });

  group('MyHomePage UI', () {
    testWidgets('shouldn\'t render text when font size is <= 0',
        (WidgetTester tester) async {
      // Arrange

      await tester.pumpWidget(const MyApp());

      final Finder textFinder = find.byKey((const Key('counter-text')));

      expect(textFinder, findsOneWidget);

      final Text textWidget = textFinder.first.evaluate().first.widget as Text;

      expect(textWidget.style!.fontSize, greaterThan(0));
    });

    testWidgets('should display title', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      final Finder titleFinder = find.text('Flutter Mutation Test Example');

      // Assert
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('should display increment button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      final Finder buttonFinder = find.byIcon(Icons.add);

      // Assert
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('should display decrement button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      final Finder buttonFinder = find.byIcon(Icons.remove);

      // Assert
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('should display reset button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      final Finder buttonFinder = find.byIcon(Icons.refresh);

      // Assert
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('should increment counter when increment button is pressed',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should reset counter when reset button is pressed',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      // Assert
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('should decrement counter when decrement button is pressed',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('should show error dialog when decrementing below 0',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
