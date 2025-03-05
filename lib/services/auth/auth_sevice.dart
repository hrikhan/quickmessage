import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSevice {
  //instance of our firestor
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //getcurrent user
  User? getcurrentuser(){
    return _firebase.currentUser;
  }
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
          //save the user info
      _firestore.collection('users').doc(authCredential.user!.uid).set({
        "uid": authCredential.user!.uid,
        'email': email,
      });
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
      // Create a new user with email and password.
      UserCredential authCredential = await _firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      //save the user info
      _firestore.collection('users').doc(authCredential.user!.uid).set({
        "uid": authCredential.user!.uid,
        'email': email,
      });
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
