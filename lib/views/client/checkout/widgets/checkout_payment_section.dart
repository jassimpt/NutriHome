import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

class CheckOutPaymentSection extends StatelessWidget {
  const CheckOutPaymentSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment method",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Change",
                style: GoogleFonts.poppins(
                  color: componentcolor,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: size.height * 0.08,
                width: size.width * 0.16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/cash-delivery_569841-175.jpg"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "Cash on delivery",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
