import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/main.dart';
import 'package:introduction_to_mutation_tests/presentation/pages/home_page.dart';
import 'package:introduction_to_mutation_tests/presentation/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyApp initializes with correct theme and home',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MyApp());

    // Act
    final BuildContext context = tester.element(find.byType(MaterialApp));
    final MaterialApp app = tester.widget(find.byType(MaterialApp));

    // Assert
    expect(app.debugShowCheckedModeBanner, false);
    expect(app.title, 'Flutter Mutation Test Example');
    expect(app.theme, isNotNull);
    expect(app.darkTheme, isNotNull);
    expect(app.home, isInstanceOf<HomePage>());

    final CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    expect(counterProvider, isNotNull);
  });
}
