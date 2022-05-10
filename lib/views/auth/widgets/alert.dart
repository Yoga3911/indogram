import 'package:flutter/material.dart';

class FailLoginAlert extends StatelessWidget {
  const FailLoginAlert({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error),
      titleTextStyle: const TextStyle(color: Colors.black),
    );
  }
}
