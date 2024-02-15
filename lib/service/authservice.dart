import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrihome/model/usermodel.dart';

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
      await firestore.collection('users').doc(name).set(user.toJson());
      return userinfo;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  signOut() async {
    try {
      firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
