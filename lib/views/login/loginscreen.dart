import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/login/phoneauthscreen.dart';
import 'package:nutrihome/views/client/register/register_screen.dart';
import 'package:nutrihome/views/widgets/custom_button.dart';
import 'package:nutrihome/views/login/widgets/customdivider.dart';
import 'package:nutrihome/views/widgets/custom_textfield.dart';
import 'package:nutrihome/views/login/widgets/tilebutton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthProvider>(context, listen: false);
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
            child: CustomTextfield(
                hinttext: "Enter your email", controller: emailcontroller),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomTextfield(
                hinttext: "Enter password", controller: passcontroller),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot password ?',
                  style: GoogleFonts.urbanist(
                      fontSize: 14, color: Colors.white.withOpacity(0.3)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              pro.signInWithEmail(emailcontroller.text, passcontroller.text);
            },
            size: size,
            buttonname: "Login",
          ),
          const CustomDivider(
            text: "Or Login with",
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TileButton(
                  size: size,
                  image: 'assets/icons/facebook_ic.png',
                  onPressed: () {},
                ),
                TileButton(
                  size: size,
                  image: 'assets/icons/google_ic.png',
                  onPressed: () {
                    pro.signInWithGoogle();
                  },
                ),
                TileButton(
                  size: size,
                  image: 'assets/icons/iphone 1.png',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PhoneAuthScreen(),
                    ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ",
                  style:
                      GoogleFonts.urbanist(fontSize: 14, color: Colors.white)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
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
