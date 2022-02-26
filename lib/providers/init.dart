import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../views/auth/providers/txt_provider.dart';

abstract class MyProvider {
  MyProvider._();

  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      lazy: true,
    )
  ];
}
