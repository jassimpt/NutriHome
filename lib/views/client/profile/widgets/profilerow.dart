import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.size,
    required this.child,
    required this.text,
    required this.onTap,
  });

  final Size size;
  final Widget? child;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
                width: size.width * 0.1,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: extrabgcolor,
                    borderRadius: BorderRadius.circular(10)),
                child: child),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              text,
              style: GoogleFonts.urbanist(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
