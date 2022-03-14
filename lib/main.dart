import 'package:firebase_core/firebase_core.dart';
import 'package:project/view_model/init.dart';
import 'package:project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        routes: Routes.data,
        initialRoute: Routes.introduction,
      ),
    );
  }
}
