import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.purpleAccent,
    useMaterial3: true,
  );
}
