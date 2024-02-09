import 'package:flutter/material.dart';
import 'package:nutrihome/helpers/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: size.width * 0.13,
          height: size.height * 0.06,
          decoration:
              const BoxDecoration(color: extrabgcolor, shape: BoxShape.circle),
          child: const Center(
              child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
