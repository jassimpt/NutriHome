import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/payment_controller.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:provider/provider.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      decoration: const BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Consumer<PaymentController>(
        builder: (context, value, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Choose',
                    style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: fontcolor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "your ",
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: fontcolor,
                        ),
                      ),
                      Text(
                        "Payment method",
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: componentcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                onTap: () {
                  String method = "Razorpay";
                  String methodlogo = "assets/icons/razorpay.jpeg";
                  value.paymentModeChanger(
                      method: method, methodlogo: methodlogo);
                  Navigator.pop(context);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/razorpay.png"),
                          fit: BoxFit.cover),
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                onTap: () {
                  String method = "Cash on delivery";
                  String methodlogo =
                      "assets/icons/cash-delivery_569841-175.jpg";
                  value.paymentModeChanger(
                      method: method, methodlogo: methodlogo);
                  Navigator.pop(context);
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/cod.jpg"),
                          fit: BoxFit.cover),
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
