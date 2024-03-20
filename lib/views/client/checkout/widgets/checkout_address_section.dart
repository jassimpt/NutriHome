import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/checkout/widgets/address_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CheckOutAddressSection extends StatelessWidget {
  const CheckOutAddressSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Address",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddressBottomSheet(size: size);
                  },
                );
              },
              child: Text(
                "Change",
                style: GoogleFonts.poppins(
                  color: componentcolor,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<FirestoreProvider>(builder: (context, value, child) {
            return value.selectedAddress != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.selectedAddress!.name!,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: fontcolor),
                      ),
                      Text(
                        value.selectedAddress!.phonenumber!,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: fontcolor),
                      ),
                      Text(
                        value.selectedAddress!.landmark!,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: fontcolor),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      "Select any address",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: fontcolor),
                    ),
                  );
          }),
        )
      ],
    );
  }
}
