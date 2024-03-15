import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/views/client/profile/widgets/addressfield.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

class AddressEditScreen extends StatefulWidget {
  const AddressEditScreen({super.key, required this.address});

  final AddressModel address;
  @override
  State<AddressEditScreen> createState() => _AddressEditScreenState();
}

class _AddressEditScreenState extends State<AddressEditScreen> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController countrycontroller = TextEditingController();

  final TextEditingController citycontroller = TextEditingController();

  final TextEditingController phonecontroller = TextEditingController();

  final TextEditingController landmarkcontroller = TextEditingController();

  final TextEditingController addresscontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.address.name!;
    countrycontroller.text = widget.address.country!;
    citycontroller.text = widget.address.city!;
    phonecontroller.text = widget.address.phonenumber!;
    landmarkcontroller.text = widget.address.landmark!;
    addresscontroller.text = widget.address.address!;
  }

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
                    AddressFields(
                      controller: namecontroller,
                      text: "Name",
                      width: size.width,
                      maxlines: 1,
                    ),
                    Row(
                      children: [
                        AddressFields(
                          controller: countrycontroller,
                          maxlines: 1,
                          text: "Country",
                          width: size.width * 0.43,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AddressFields(
                          controller: citycontroller,
                          maxlines: 1,
                          text: "City",
                          width: size.width * 0.43,
                        ),
                      ],
                    ),
                    AddressFields(
                      controller: phonecontroller,
                      text: "Phone Number",
                      width: size.width,
                      maxlines: 1,
                    ),
                    AddressFields(
                      controller: addresscontroller,
                      maxlines: 1,
                      text: "Address",
                      width: size.width,
                    ),
                    AddressFields(
                      controller: landmarkcontroller,
                      maxlines: 1,
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
                        onPressed: () {
                          updateAddress();
                        },
                        child: Text(
                          "Update Address",
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

  updateAddress() {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final AddressModel address = AddressModel(
        address: addresscontroller.text,
        city: citycontroller.text,
        country: countrycontroller.text,
        landmark: landmarkcontroller.text,
        name: namecontroller.text,
        phonenumber: phonecontroller.text);
    pro.updateUserAddress(landmark: widget.address.landmark!, address: address);

    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('Address Updated')));
    IconSnackBar.show(
        context: context,
        snackBarType: SnackBarType.save,
        label: 'Address updated');
    Navigator.pop(context);
  }
}
