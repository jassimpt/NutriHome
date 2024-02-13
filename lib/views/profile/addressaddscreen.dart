import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/profile/widgets/addressfield.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';

class AddressAddScreen extends StatelessWidget {
  const AddressAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomBackButton(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    top: 10,
                    size: size,
                    color: extrabgcolor,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Address',
                    style: GoogleFonts.urbanist(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    AddressFields(text: "Name", width: size.width),
                    Row(
                      children: [
                        AddressFields(
                          text: "Country",
                          width: size.width * 0.43,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AddressFields(
                          text: "City",
                          width: size.width * 0.43,
                        ),
                      ],
                    ),
                    AddressFields(text: "Phone Number", width: size.width),
                    AddressFields(
                      text: "Address",
                      width: size.width,
                    ),
                    AddressFields(
                      text: "Landmark",
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor:
                                const MaterialStatePropertyAll(componentcolor)),
                        onPressed: () {},
                        child: Text(
                          "Save Address",
                          style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: fontcolor),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
