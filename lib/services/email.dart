import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class EmailService {
  EmailService._();

  static Future<void> signUp({String email = "email", String password = "password"}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (FirebaseAuth.instance.currentUser != null &&
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        log("Verif email");
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }

      log("Login success");

      return;
    } on FirebaseAuthException catch (e) {
      assert(e.code != "weak-password", "Password yang anda masukkan tidak aman");
      assert(e.code != "email-already-in-use", "Email sudah terdaftar");
      rethrow;
    }
  }

  static Future<UserCredential> signIn({String email = "email@gmail.com", String password = "password"}) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log("Login success");
      return user;
    } on FirebaseAuthException catch (e) {
      assert(e.code != "user-not-found", "User tidak ditemukan");
      assert(e.code != "wrong-password", "Password salah");
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    log("Success log out from email account");
  }
}
