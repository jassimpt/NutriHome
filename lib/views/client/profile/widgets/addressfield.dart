import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

class AddressFields extends StatelessWidget {
  const AddressFields(
      {super.key,
      required this.text,
      required this.width,
      required this.controller,
      required this.maxlines});
  final String text;
  final double? width;
  final int? maxlines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.urbanist(
              fontSize: 20, fontWeight: FontWeight.bold, color: fontcolor),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            style: TextStyle(color: fontcolor),
            controller: controller,
            maxLines: maxlines,
            decoration: InputDecoration(
                filled: true,
                fillColor: extrabgcolor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15))),
          ),
        )
      ],
    );
  }
}
