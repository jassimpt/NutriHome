import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(text,
                style: GoogleFonts.urbanist(fontSize: 14, color: Colors.white)),
          ),
          const Expanded(
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
