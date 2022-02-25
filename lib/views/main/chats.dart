import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Scaffold(
      body: Center(
        child: Text("Chats"),
      ),
    ));
  }
}
