import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/profile/widgets/orderslist.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomBackButton(
                      size: size,
                      color: extrabgcolor,
                      bottom: 0,
                      left: 30,
                      right: 30,
                      top: 0,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: size.width * 0.08,
                  ),
                  Text(
                    'My ',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text(
                    "Orders",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: componentcolor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: OrdersList(size: size),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
