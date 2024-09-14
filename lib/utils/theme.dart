import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      hintColor: Colors.blueAccent,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
    );
  }
}
