import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:nutrihome/views/widgets/custom_button.dart';
import 'package:nutrihome/views/login/widgets/customphonefield.dart';
import 'package:nutrihome/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: CustomBackButton(
                  bottom: 30,
                  left: 30,
                  right: 30,
                  top: 30,
                  size: size,
                  color: extrabgcolor,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey',
                    style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text(
                    'Enter your phone',
                    style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text("to send otp!",
                      style: GoogleFonts.urbanist(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: componentcolor)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: CustomPhoneField(phonecontroller: phonecontroller),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: CustomTextfield(
                  hinttext: "enter your name", controller: namecontroller),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: CustomTextfield(
                  hinttext: "enter your email", controller: emailcontroller),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onPressed: () {
                String countrycode = "+91";
                String phonenumber = countrycode + phonecontroller.text;
                pro.signInWithPhone(phonenumber, namecontroller.text,
                    emailcontroller.text, context);
              },
              size: size,
              buttonname: "Send code",
            ),
          ],
        ),
      ),
    );
  }
}
