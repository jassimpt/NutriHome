import 'package:flutter/material.dart';
import 'package:nutrihome/helpers/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/NutriHometext.png",
              height: size.height * 0.08,
            )
          ],
        ),
      ),
    );
  }
}
