import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/social_service.dart';

class EmailService extends SocialService {
  final _auth = FirebaseAuth.instance;
  Future<void> signUp({String email = "email", String password = "password"}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return;
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      rethrow;
    }
  }

  @override
  Future<UserCredential> signIn({String email = "email@gmail.com", String password = "password"}) async {
    try {
      final UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch(e) {
      if (e.code == "user-not-found") {
        log("User not found");
      } else if (e.code == "wrong-password") {
        log("Invalid password");
      }
      log(e.message.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}