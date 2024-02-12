import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

class CustomLongButton extends StatelessWidget {
  const CustomLongButton({super.key, required this.size, required this.onTap});

  final Size size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width,
          height: size.height * 0.07,
          decoration: BoxDecoration(
              color: componentcolor, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proceed to checkout',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: fontcolor),
                ),
                Image.asset(
                  "assets/icons/arrow.png",
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
