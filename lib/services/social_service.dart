import 'package:firebase_auth/firebase_auth.dart';

abstract class SocialService {
  Future<UserCredential> signIn();
  Future<void> signOut();
}
