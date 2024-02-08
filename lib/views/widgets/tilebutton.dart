import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    super.key,
    required this.size,
    required this.image,
    required this.onPressed,
  });

  final Size size;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.26,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
          child: Image.asset(
            image,
            height: size.height * 0.04,
          )),
    );
  }
}
