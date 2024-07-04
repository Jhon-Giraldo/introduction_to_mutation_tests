import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/presentation/widgets/error_dialog.dart';

void main() {
  testWidgets('showErrorDialog displays an error dialog',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () =>
                      showErrorDialog(context, 'Test error message'),
                  child: const Text('Show Error'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Show Error'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Test error message'), findsOneWidget);
    expect(find.text('Cerrar'), findsOneWidget);
  });
}
