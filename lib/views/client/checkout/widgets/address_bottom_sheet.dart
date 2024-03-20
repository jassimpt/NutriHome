import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/controller/payment_controller.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:provider/provider.dart';

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.4,
      decoration: const BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Consumer<PaymentController>(
        builder: (context, value, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: widget.size.height * 0.02,
                  ),
                  Text(
                    'Choose',
                    style: GoogleFonts.urbanist(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: fontcolor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "your ",
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: fontcolor,
                        ),
                      ),
                      Text(
                        "Address",
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: componentcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
            Consumer<FirestoreProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.addresslist.length,
                  itemBuilder: (context, index) {
                    final AddressModel address = value.addresslist[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: GestureDetector(
                        onTap: () {
                          value.addressSelector(address: address);
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: widget.size.width,
                            height: widget.size.height * 0.1,
                            decoration: BoxDecoration(
                                color: productbgcolor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address.name!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: fontcolor),
                                  ),
                                  Text(
                                    address.address!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: fontcolor),
                                  ),
                                  Text(
                                    address.phonenumber!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: fontcolor),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
