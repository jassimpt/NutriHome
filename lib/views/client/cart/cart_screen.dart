import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/cart/widgets/cart_items.dart';
import 'package:nutrihome/views/widgets/custom_long_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchCartItems();
  }

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
                        '₹ 500',
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
                onTap: () {},
                buttonname: "Proceed to checkout",
              )
            ],
          ),
        ),
      ),
    );
  }
}
