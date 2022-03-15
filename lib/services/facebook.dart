import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookService {
  FacebookService._();
  static Future<UserCredential> signIn() async {
    try {
      final LoginResult user = await FacebookAuth.instance.login();
      final OAuthCredential credential = FacebookAuthProvider.credential(user.accessToken!.token);

      log("Login success");

      return FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch(e) {
      log(e.message.toString());
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    log("Success log out from facebook account");
  }
}