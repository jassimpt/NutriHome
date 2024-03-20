import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/cart/widgets/cart_items.dart';
import 'package:nutrihome/views/client/checkout/checkout_screen.dart';
import 'package:nutrihome/views/widgets/custom_long_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<FirestoreProvider>(context, listen: true);

    var totalAmount = pro.cartlist.isNotEmpty
        ? pro.cartlist
            .map((product) => (product.price ?? 0) * (product.quantity ?? 0))
            .reduce((value, element) => value + element)
        : 0.0;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My ',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                  Text(
                    "Cart",
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
              pro.cartlist.isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CartItems(size: size),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Consumer<FirestoreProvider>(
                            builder: (context, value, child) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total ${value.cartlist.length} Items :',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: fontcolor),
                                ),
                                Text(
                                  totalAmount.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: fontcolor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomLongButton(
                          size: size,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOutScreen(
                                    subTotal: totalAmount,
                                  ),
                                ));
                          },
                          buttonname: "Proceed to checkout",
                        )
                      ],
                    )
                  : Center(
                      child: LottieBuilder.asset(
                          'assets/lottie/Animation - 1709009620778.json'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
