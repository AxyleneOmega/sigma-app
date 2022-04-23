import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<User?> currentUser();
  Future<String?> userEmail();
  Future<void> logOut();
}

class Auth implements BaseAuth {
  Auth();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<User?> currentUser() async {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<String?> userEmail() async {
    User? user = _firebaseAuth.currentUser;
    return user!.email;
  }

  @override
  Future<void> logOut() async {
    return await _firebaseAuth.signOut();
  }
}
