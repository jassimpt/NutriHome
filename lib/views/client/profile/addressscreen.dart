import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/profile/addressaddscreen.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';
import 'package:nutrihome/views/widgets/customlongbutton.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
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
                  width: size.width * 0.07,
                ),
                Text(
                  'Addresses',
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: fontcolor),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.73,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          color: extrabgcolor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jassim",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: fontcolor),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/icons/🦆 icon _edit_.png",
                                          height: 20,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/icons/delete.png",
                                          height: 20,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "Pilathottathil house v.kpadi",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: fontcolor),
                            ),
                            Text(
                              "Tirurangadi,kerala",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: fontcolor),
                            ),
                            Text(
                              "Phonenumber:-9961666937",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: fontcolor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomLongButton(
              size: size,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressAddScreen(),
                    ));
              },
              buttonname: "Add new address",
            )
          ],
        ),
      ),
    );
  }
}
