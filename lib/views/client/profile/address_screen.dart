import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/views/client/profile/address_add_screen.dart';
import 'package:nutrihome/views/client/profile/address_edit_screen.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:nutrihome/views/widgets/custom_long_button.dart';
import 'package:provider/provider.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchUserAddress();
  }

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
              child:
                  Consumer<FirestoreProvider>(builder: (context, value, child) {
                if (value.addresslist.isEmpty) {
                  return Center(
                    child: Text(
                      'Add your address',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: value.addresslist.length,
                    itemBuilder: (context, index) {
                      final AddressModel address = value.addresslist[index];
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      address.name!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: fontcolor),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddressEditScreen(
                                                      address: address,
                                                    ),
                                                  ));
                                            },
                                            icon: Image.asset(
                                              "assets/icons/🦆 icon _edit_.png",
                                              height: 20,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              value.deleteUserAddress(
                                                  landmark: address.landmark!);
                                            },
                                            icon: Image.asset(
                                              "assets/icons/delete.png",
                                              height: 20,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  address.address!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: fontcolor),
                                ),
                                Text(
                                  "${address.city} ${address.country}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: fontcolor),
                                ),
                                Text(
                                  "Phonenumber:-${address.phonenumber}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: fontcolor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
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
