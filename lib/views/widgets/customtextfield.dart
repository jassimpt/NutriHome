import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    required this.hinttext,
    super.key,
  });

  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hinttext,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
