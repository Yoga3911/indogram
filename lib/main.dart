import 'package:project/views/introduction/introduction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/style.dart';
import 'views/auth/providers/txt_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = ThemeData(
        primarySwatch: const MaterialColor(0xFF6C63FF, <int, Color>{
          50: Core.primary,
          100: Core.primary,
          200: Core.primary,
          300: Core.primary,
          400: Core.primary,
          500: Core.primary,
          600: Core.primary,
          700: Core.primary,
          800: Core.primary,
        }),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            fontFamily: "Lato"),
        scaffoldBackgroundColor: Core.secondary,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.white,
            selectedItemColor: Core.primary,
            backgroundColor: Core.component,
            elevation: 0));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyTextEditing(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        theme: _themeData,
        debugShowCheckedModeBanner: false,
        home: const IntroductionPage(),
      ),
    );
  }
}
