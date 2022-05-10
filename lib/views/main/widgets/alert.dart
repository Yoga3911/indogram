import 'package:flutter/material.dart';
import 'package:project/services/email.dart';
import 'package:project/services/facebook.dart';
import 'package:project/services/google.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/routes.dart';

class SignOutAlert extends StatelessWidget {
  const SignOutAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text(
        "Perhatian!",
        style: TextStyle(color: Colors.black),
      ),
      content: const Text(
        "Apakah anda yakin ingin keluar?",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            switch (pref.get("social").toString()) {
              case "email":
                EmailService.signOut();
                break;
              case "google":
                GoogleService.signOut();
                break;
              case "facebook":
                FacebookService.signOut();
                break;
            }
            pref.remove("social");
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text("Ya"),
        ),
      ],
    );
  }
}
