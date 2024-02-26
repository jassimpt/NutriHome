import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key,
      required this.size,
      required this.color,
      required this.child,
      required this.bottom,
      required this.left,
      required this.right,
      required this.top});

  final Size size;
  final Color? color;
  final Widget? child;
  final double left;
  final double top;
  final double right;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: size.width * 0.13,
          height: size.height * 0.06,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(child: child),
        ),
      ),
    );
  }
}
