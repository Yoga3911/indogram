import 'package:project/providers/init.dart';
import 'package:project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProvider.providers,
      child: MaterialApp(
        theme: Core.myTheme(context),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: "/introduction",
      ),
    );
  }
}
