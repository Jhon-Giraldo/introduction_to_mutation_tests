import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/main.dart';

void main() {
  group('HomePage UI', () {
    testWidgets('should display title', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      final Finder titleFinder = find.text('Flutter Mutation Test Example 2.0');

      // Assert
      expect(titleFinder, findsOneWidget);
    });
  });
}
