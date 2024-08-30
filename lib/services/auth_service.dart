import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/handle_auth_error.dart';

class AuthService {
  AuthService._();

  static final AuthService _instance = AuthService._();

  factory AuthService() {
    return _instance;
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      handleAuthError(e.code);
    }
  }

  Future<void> registerUser(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      handleAuthError(e.code);
    } catch (e) {
      if (e == "email already in used") {
        handleAuthError("Email already in use");
      } else {
        handleAuthError("Error $e");
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
