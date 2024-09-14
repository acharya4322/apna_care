import 'package:apna_care/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ApnaCareApp());
}

class ApnaCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apna Care',
      // theme: appTheme, // Apply the custom theme
      initialRoute: AppRoutes.home, // Set the initial route using AppRoutes
      onGenerateRoute: AppRoutes.generateRoute, // Use the route generator
    );
  }
}
