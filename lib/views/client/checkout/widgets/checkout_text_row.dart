import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutTextRow extends StatelessWidget {
  const CheckOutTextRow({super.key, required this.text, required this.amount});

  final String text;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
