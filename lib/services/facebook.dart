import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'social_service.dart';

class FacebookService extends SocialService {
  @override
  Future<UserCredential> signIn() async {
    try {
      final LoginResult user = await FacebookAuth.instance.login();
      final OAuthCredential credential = FacebookAuthProvider.credential(user.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch(e) {
      log(e.message.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

}