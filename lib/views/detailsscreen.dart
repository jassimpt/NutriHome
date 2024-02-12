import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/productsmodel.dart';
import 'package:nutrihome/views/widgets/custombackbutton.dart';
import 'package:nutrihome/views/widgets/detailsrow.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: extrabgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                      bottom: 30,
                      left: 30,
                      right: 30,
                      top: 30,
                      size: size,
                      color: backgroundcolor,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  CustomBackButton(
                      bottom: 30,
                      left: 30,
                      right: 30,
                      top: 30,
                      size: size,
                      color: backgroundcolor,
                      child: Image.asset(
                        "assets/icons/Bag.png",
                        height: 30,
                      ))
                ],
              ),
            ),
            Center(
              child: Image.asset(
                product.image!,
                height: size.height * 0.25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: size.width * 0.1,
                      height: size.height * 0.04,
                      decoration: const BoxDecoration(
                          color: backgroundcolor, shape: BoxShape.circle),
                      child: Center(
                          child: Image.asset(
                        "assets/icons/wish.png",
                        height: 20,
                      )),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: size.height * 0.5,
              ),
              width: size.width,
              decoration: const BoxDecoration(
                  color: backgroundcolor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name!,
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: fontcolor,
                        ),
                      ),
                    ),
                    DetailsRow(
                      size: size,
                      head1: "Weight",
                      head2: "Total servings",
                      value1: product.weight!,
                      width: size.width * 0.18,
                      value2: product.totalservings.toString(),
                    ),
                    DetailsRow(
                      size: size,
                      head1: "Flavour",
                      head2: "Serving",
                      width: size.width * 0.4,
                      value1: product.flavour!,
                      value2: product.serving.toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            color: extrabgcolor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Text(
                              "How to use",
                              style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: fontcolor,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.howtouse!,
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total price",
                                style: GoogleFonts.urbanist(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                "₹ ${product.price}",
                                style: GoogleFonts.urbanist(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(componentcolor)),
                              onPressed: () {},
                              child: Text(
                                "Add to cart",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: fontcolor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
