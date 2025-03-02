import 'package:firebase_auth/firebase_auth.dart';

class AuthSevice {
  //fisebasae instance

  FirebaseAuth _firebase = FirebaseAuth.instance;
  //sign in
  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential authCredential = await _firebase
          .signInWithEmailAndPassword(email: email, password: password);
      return authCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signup
  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential authCredential = await _firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      return authCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout
  void signout() async {
    await _firebase.signOut();
  }

  //error massage
}
