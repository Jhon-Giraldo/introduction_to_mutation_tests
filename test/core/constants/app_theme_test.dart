import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_to_mutation_tests/core/constants/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme should have blueGrey as primary color', () {
      // Act
      final ThemeData theme = AppTheme.lightTheme;

      // Assert
      expect(theme.primaryColor, Colors.blueGrey);
      expect(theme.useMaterial3, true);
    });

    test('darkTheme should have purpleAccent as primary color', () {
      // Act
      final ThemeData theme = AppTheme.darkTheme;

      // Assert
      expect(theme.primaryColor, Colors.purpleAccent);
      expect(theme.useMaterial3, true);
    });
  });
}
