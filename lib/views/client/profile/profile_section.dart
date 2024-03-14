import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/profile/address_screen.dart';
import 'package:nutrihome/views/client/profile/orders_screen.dart';
import 'package:nutrihome/views/client/profile/personal_details.dart';
import 'package:nutrihome/views/client/profile/widgets/profilerow.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

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
                child: Consumer<FirestoreProvider>(
                  builder: (context, value, child) => Container(
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
                                image: DecorationImage(
                                    image: value.currentUser!.image != null
                                        ? NetworkImage(
                                            value.currentUser!.image!)
                                        : const AssetImage(
                                                "assets/icons/profile.png")
                                            as ImageProvider,
                                    fit: BoxFit.cover),
                                color: extrabgcolor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                value.currentUser!.username!,
                                style: GoogleFonts.urbanist(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: fontcolor,
                                ),
                              ),
                            ),
                            Text(
                              value.currentUser!.email!,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PersonalDetailsScreen(),
                                ));
                          },
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
                                    builder: (context) => const OrdersScreen(),
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
                                  builder: (context) =>
                                      const AddressListScreen(),
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
                  decoration: BoxDecoration(
                      color: productbgcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Consumer<AuthProvider>(
                      builder: (context, value, child) => Column(
                        children: [
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
                              size: size,
                              text: "Logout",
                              onTap: () {
                                value.signOut();
                              },
                              child: const Icon(
                                Iconsax.logout,
                                color: Colors.white,
                              ))
                        ],
                      ),
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
