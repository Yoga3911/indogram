import 'dart:math';

import 'package:flutter/material.dart';

class DropDownChanged with ChangeNotifier {
  String gender;
  IconData icon;

  DropDownChanged({
    this.gender = "Laki - laki",
    this.icon = Icons.male_rounded,
  });

  bool isShow = false;
  double rotate = pi * 0;

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
}
