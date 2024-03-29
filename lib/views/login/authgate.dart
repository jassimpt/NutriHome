import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/views/Admin/bottom_nav/bottom_nav_admin.dart';
import 'package:nutrihome/views/login/loginscreen.dart';
import 'package:nutrihome/views/client/bottom_nav/bottom_nav.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.email == "admin@gmail.com") {
            return const BottomNavAdmin();
          } else {
            return const BottomNav();
          }
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
