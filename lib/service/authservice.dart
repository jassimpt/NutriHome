import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutrihome/model/usermodel.dart';
import 'package:nutrihome/views/login/otpscreen.dart';
import 'package:pinput/pinput.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<UserCredential> signInWithEmail(String email, String pass) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> signUpWithEmail(
      String email, String password, String name) async {
    try {
      UserCredential userinfo = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user =
          UserModel(email: email, username: name, uid: userinfo.user!.uid);
      await firestore
          .collection('users')
          .doc(userinfo.user!.uid)
          .set(user.toJson());
      return userinfo;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gauth = await guser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? googleuser = userCredential.user;
      final UserModel userdata = UserModel(
          email: googleuser!.email,
          username: googleuser.displayName,
          uid: googleuser.uid);
      await firestore
          .collection('users')
          .doc(googleuser.uid)
          .set(userdata.toJson());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  signInWithPhone(String phonenumber, String name, String email,
      BuildContext context) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            // UserCredential credential =
            //     await firebaseAuth.signInWithCredential(phoneAuthCredential);

            // throw Exception("Storing");
          },
          verificationFailed: (FirebaseAuthException error) {
            throw Exception(error.message);
          },
          codeSent: (verificationcode, resendToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(
                      verificationid: verificationcode,
                      email: email,
                      name: name),
                ));
          },
          codeAutoRetrievalTimeout: (String codeAutoRetrievalTimeout) {});
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  verifyOtp(
      {required String verificationid,
      required String otp,
      required String name,
      required String email,
      required Function onSuccess}) async {
    try {
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationid, smsCode: otp);
      User? user = (await firebaseAuth.signInWithCredential(cred)).user;

      if (user != null) {
        final UserModel userdata =
            UserModel(email: email, username: name, uid: user.uid);
        firestore.collection('users').doc(user.uid).set(userdata.toJson());
        onSuccess();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  signOut() async {
    final GoogleSignIn google = GoogleSignIn();

    try {
      await firebaseAuth.signOut();
      await google.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
