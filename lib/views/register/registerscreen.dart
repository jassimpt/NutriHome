import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/authprovider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/login/loginscreen.dart';
import 'package:nutrihome/views/widgets/custombutton.dart';
import 'package:nutrihome/views/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

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
                  'Hello! Register to',
                  style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: fontcolor),
                ),
                Text("get started",
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
            child: CustomTextfield(
                hinttext: "Username", controller: usernamecontroller),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child:
                CustomTextfield(hinttext: "Email", controller: emailcontroller),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: CustomTextfield(
                hinttext: "Password", controller: passwordcontroller),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: CustomTextfield(
              hinttext: "Confirm password",
              controller: confirmpasswordcontroller,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              signUpWithEmail(context);
            },
            size: size,
            buttonname: "Register",
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ",
                  style:
                      GoogleFonts.urbanist(fontSize: 14, color: Colors.white)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text('Login Now',
                    style:
                        GoogleFonts.urbanist(fontSize: 14, color: extracolor)),
              ),
            ],
          )
        ],
      ),
    );
  }

  signUpWithEmail(BuildContext context) {
    if (passwordcontroller.text == confirmpasswordcontroller.text) {
      Provider.of<AuthProvider>(context, listen: false).signUpWithEmail(
          emailcontroller.text,
          passwordcontroller.text,
          usernamecontroller.text);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Passwords Not Same')));
    }
  }
}
