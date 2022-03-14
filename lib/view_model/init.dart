import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_provider.dart';

class MyProvider {
  MyProvider._();

  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      lazy: true,
    )
  ];
}
