import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/views/Admin/bottomnav/bottomnavadmin.dart';
import 'package:nutrihome/views/login/loginscreen.dart';
import 'package:nutrihome/views/client/bottomnav/bottomnav.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.email == "admin@gmail.com") {
            return BottomNavAdmin();
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
