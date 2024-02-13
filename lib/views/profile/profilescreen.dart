import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

import 'package:nutrihome/views/profile/addressscreen.dart';
import 'package:nutrihome/views/profile/ordersscreen.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';
import 'package:nutrihome/views/profile/widgets/profilerow.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  Text(
                    'My ',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: componentcolor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Container(
                  width: size.width,
                  height: size.height * 0.12,
                  decoration: BoxDecoration(
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: size.height * 0.1,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/icons/user.png"),
                                  fit: BoxFit.cover),
                              color: extrabgcolor,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              "Jhon Sebastian",
                              style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontcolor,
                              ),
                            ),
                          ),
                          Text(
                            "jhon@gmail.com",
                            style: GoogleFonts.urbanist(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Container(
                  width: size.width,
                  height: size.height * 0.26,
                  decoration: BoxDecoration(
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ProfileRow(
                          onTap: () {},
                          size: size,
                          text: "Personal Details",
                          child: const Icon(
                            Icons.verified_user,
                            color: Colors.white,
                          ),
                        ),
                        ProfileRow(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrdersScreen(),
                                  ));
                            },
                            size: size,
                            text: "My Orders",
                            child: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            )),
                        ProfileRow(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressListScreen(),
                                ));
                          },
                          size: size,
                          text: "Shipping address",
                          child: const Icon(
                            Icons.local_shipping,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Container(
                  width: size.width,
                  height: size.height * 0.26,
                  decoration: BoxDecoration(
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ProfileRow(
                            onTap: () {},
                            size: size,
                            text: "FAQs",
                            child: Image.asset("assets/icons/faq.png")),
                        ProfileRow(
                          onTap: () {},
                          size: size,
                          text: "Privacy policy",
                          child: const Icon(
                            Icons.privacy_tip,
                            color: Colors.white,
                          ),
                        ),
                        ProfileRow(
                          onTap: () {},
                          size: size,
                          text: "Contact us",
                          child: const Icon(
                            Icons.contact_emergency,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
