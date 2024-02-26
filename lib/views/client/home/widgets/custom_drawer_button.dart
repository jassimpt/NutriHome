import 'package:flutter/material.dart';
import 'package:nutrihome/helpers/colors.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton(
      {super.key,
      required this.size,
      required this.onTap,
      required this.child});

  final Size size;
  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * 0.13,
          height: size.height * 0.06,
          decoration:
              const BoxDecoration(color: extrabgcolor, shape: BoxShape.circle),
          child: Center(child: child),
        ),
      ),
    );
  }
}
