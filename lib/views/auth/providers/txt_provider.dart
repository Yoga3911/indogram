import 'package:flutter/material.dart';

class MyTextEditing with ChangeNotifier {
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passLogin = TextEditingController();

  final TextEditingController nameRegis = TextEditingController();
  final TextEditingController emailRegis = TextEditingController();
  final TextEditingController pass1Regis = TextEditingController();
  final TextEditingController pass2Regis = TextEditingController();

  Map<String, String> loginValue() => {
        "email": emailLogin.text,
        "password": passLogin.text,
      };

  Map<String, String> registerValue() => {
        "name": nameRegis.text,
        "email": emailRegis.text,
        "password1": pass1Regis.text,
        "password2": pass2Regis.text,
      };

  @override
  void dispose() {
    emailLogin.dispose();
    passLogin.dispose();
    nameRegis.dispose();
    emailRegis.dispose();
    pass1Regis.dispose();
    pass2Regis.dispose();
    super.dispose();
  }
}