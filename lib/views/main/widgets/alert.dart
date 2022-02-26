import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

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
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, "/auth/login", (route) => false),
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
