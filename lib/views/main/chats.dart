import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: FutureBuilder<QuerySnapshot>(
            future: users.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data!.docs.map((e) => Text(e["nama"])).toList(),);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
