import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/service/authservice.dart';

class AuthProvider extends ChangeNotifier {
  AuthService service = AuthService();

  Future<UserCredential> signInWithEmail(String email, String pass) {
    return service.signInWithEmail(email, pass);
  }

  Future<UserCredential> signUpWithEmail(
      String email, String password, String name) {
    return service.signUpWithEmail(email, password, name);
  }

  Future<UserCredential> signInWithGoogle() {
    return service.signInWithGoogle();
  }

  signInWithPhone(
      String phonenumber, String name, String email, BuildContext context) {
    try {
      service.signInWithPhone(phonenumber, name, email, context);
    } catch (e) {
      throw Exception(e);
    }
  }

  verifyOtp(String verificationid, String otp, Function onSuccess, String name,
      String email) {
    try {
      service.verifyOtp(
          verificationid: verificationid,
          otp: otp,
          onSuccess: onSuccess,
          email: email,
          name: name);
    } catch (e) {
      throw Exception(e);
    }
  }

  signOut() {
    return service.signOut();
  }
}
