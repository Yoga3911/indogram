import 'package:flutter/material.dart';

abstract class Core {
  static ThemeData myTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: const MaterialColor(0xFF6C63FF, <int, Color>{
        50: primary,
        100: primary,
        200: primary,
        300: primary,
        400: primary,
        500: primary,
        600: primary,
        700: primary,
        800: primary,
      }),
      textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          fontFamily: "Lato"),
      scaffoldBackgroundColor: Core.secondary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: primary,
        backgroundColor: component,
        elevation: 0,
      ),
    );
  }

  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryX = Color.fromRGBO(108, 99, 255, 0.3);
  static const Color secondary = Color(0xFF131313);
  static const Color component = Color(0xFF2C2C2C);
}
