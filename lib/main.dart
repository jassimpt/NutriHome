import 'package:flutter/material.dart';
import 'package:nutrihome/views/loginscreen.dart';
import 'package:nutrihome/views/registerscreen.dart';
import 'package:nutrihome/views/splashscreen.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
