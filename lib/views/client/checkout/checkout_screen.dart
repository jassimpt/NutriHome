import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/views/client/cart/widgets/cart_items.dart';
import 'package:nutrihome/views/client/checkout/widgets/checkout_address_section.dart';
import 'package:nutrihome/views/client/checkout/widgets/checkout_payment_section.dart';
import 'package:nutrihome/views/client/checkout/widgets/checkout_text_row.dart';
import 'package:nutrihome/views/widgets/custom_long_button.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<FirestoreProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order review",
          style: GoogleFonts.urbanist(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<FirestoreProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.cartlist.length,
                      itemBuilder: (context, index) {
                        final CartItemModel cartitem = value.cartlist[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.13,
                            decoration: BoxDecoration(
                                color: productbgcolor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Container(
                                      width: size.width * 0.3,
                                      height: size.height * 0.11,
                                      decoration: BoxDecoration(
                                          color: extrabgcolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Image.network(
                                        cartitem.imageurl!,
                                      )),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          cartitem.name!,
                                          maxLines: 2,
                                          style: GoogleFonts.urbanist(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: fontcolor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: componentcolor.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const CheckOutTextRow(
                            amount: "5000",
                            text: "Subtotal",
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const CheckOutTextRow(
                              text: "Shipping fee", amount: "free"),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order total",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "10000",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Divider(
                            color: extracolor,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          // payment method col
                          CheckOutPaymentSection(size: size),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CheckOutAddressSection(size: size)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
