import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/controller/location_controller.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/views/client/profile/widgets/addressfield.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

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
                child: Consumer<LocationController>(
                  builder: (context, value, child) => Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromRGBO(254, 170, 43, 1))),
                          onPressed: () {
                            value.getCurrentLocationAndFillAddress();
                          },
                          child: value.isloading
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "Get my current location",
                                  style: GoogleFonts.urbanist(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: fontcolor),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AddressFields(
                        controller: value.namecontroller,
                        text: "Name",
                        width: size.width,
                        maxlines: 1,
                      ),
                      Row(
                        children: [
                          AddressFields(
                            controller: value.countrycontroller,
                            maxlines: 1,
                            text: "Country",
                            width: size.width * 0.43,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AddressFields(
                            controller: value.citycontroller,
                            maxlines: 1,
                            text: "City",
                            width: size.width * 0.43,
                          ),
                        ],
                      ),
                      AddressFields(
                        controller: value.phonecontroller,
                        text: "Phone Number",
                        width: size.width,
                        maxlines: 1,
                      ),
                      AddressFields(
                        controller: value.addresscontroller,
                        maxlines: 1,
                        text: "Address",
                        width: size.width,
                      ),
                      AddressFields(
                        controller: value.landmarkcontroller,
                        maxlines: 1,
                        text: "Landmark",
                        width: size.width,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                        width: size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  componentcolor)),
                          onPressed: () {
                            saveAddress(context);
                            Navigator.pop(context);
                          },
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  saveAddress(BuildContext context) {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final locationpro = Provider.of<LocationController>(context, listen: false);
    AddressModel address = AddressModel(
        address: locationpro.addresscontroller.text,
        city: locationpro.citycontroller.text,
        country: locationpro.countrycontroller.text,
        landmark: locationpro.landmarkcontroller.text,
        name: locationpro.namecontroller.text,
        phonenumber: locationpro.phonecontroller.text);
    pro.saveUserAddress(
        landmark: locationpro.landmarkcontroller.text, address: address);
    IconSnackBar.show(
        context: context,
        snackBarType: SnackBarType.save,
        label: 'Address saved');
    Navigator.pop(context);
  }
}
