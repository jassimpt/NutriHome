import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/widgets/custombutton.dart';
import 'package:nutrihome/views/widgets/customdivider.dart';
import 'package:nutrihome/views/widgets/customtextfield.dart';
import 'package:nutrihome/views/widgets/tilebutton.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: fontcolor),
                ),
                Text("Glad to see you,",
                    style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: componentcolor)),
                Text("Again!",
                    style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontcolor)),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: CustomTextfield(hinttext: "Enter your email"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomTextfield(hinttext: "Enter password"),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {},
            size: size,
            buttonname: "Login",
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ",
                  style:
                      GoogleFonts.urbanist(fontSize: 14, color: Colors.white)),
              GestureDetector(
                onTap: () {},
                child: Text('Register Now',
                    style:
                        GoogleFonts.urbanist(fontSize: 14, color: extracolor)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
