import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/authprovider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/bottomnav/bottomnav.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';
import 'package:nutrihome/views/widgets/custombutton.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationid, this.email, this.name});

  final String verificationid;
  final String? name;
  final String? email;
  final TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Otp",
                      style: GoogleFonts.urbanist(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: componentcolor)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'verification',
                    style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/cloud.png',
                height: size.height / 3.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the verification code we just sent on your',
                    style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text(
                    'phonenumber',
                    style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: componentcolor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Pinput(
                controller: otpcontroller,
                length: 6,
                showCursor: true,
                defaultPinTheme: const PinTheme(
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
              onPressed: () {
                verifyOtp(context);
              },
              size: size,
              buttonname: "Verify otp",
            ),
          ],
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .verifyOtp(verificationid, otpcontroller.text, () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
    }, name!, email!);
  }
}
