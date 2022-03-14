import 'dart:math';

import 'package:flutter/material.dart';

import '../models/auth.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({
    this.gender = "Laki - laki",
    this.icon = Icons.male_rounded,
  });

  String gender;
  IconData icon;

  bool isShow = false;
  double rotate = pi * 0;

  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passLogin = TextEditingController();

  final TextEditingController nameRegis = TextEditingController();
  final TextEditingController emailRegis = TextEditingController();
  final TextEditingController pass1Regis = TextEditingController();
  final TextEditingController pass2Regis = TextEditingController();

  LoginModel loginValue() => LoginModel(
        email: emailLogin.text,
        password: passLogin.text,
      );

  Map<String, String> registerValue() => {
        "name": nameRegis.text,
        "email": emailRegis.text,
        "password1": pass1Regis.text,
        "password2": pass2Regis.text,
      };

  void changeGender(String gen) {
    if (rotate == pi * 0) {
      rotate = pi * 180;
    } else {
      rotate = pi * 0;
    }
    isShow = !isShow;
    if (gen == "Laki - laki") {
      gender = "Laki - laki";
      icon = Icons.male_rounded;
    } else if (gen == "Perempuan") {
      gender = "Perempuan";
      icon = Icons.female_rounded;
    }
    notifyListeners();
  }

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
