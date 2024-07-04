import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/main.dart';

void main() {
  group('Counter Widgets', () {
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
