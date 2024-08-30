import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void handleAuthError(String errorCode) {
  String errorMessage;
  switch (errorCode) {
    case 'invalid-email':
      errorMessage = 'The email address is not valid.';
      break;
    case 'user-disabled':
      errorMessage = 'This user has been disabled.';
      break;
    case 'user-not-found':
      errorMessage = 'No user found for that email.';
      break;
    case 'wrong-password':
      errorMessage = 'Wrong password provided.';
      break;
    default:
      errorMessage = 'An undefined Error happened.';
  }
  Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
