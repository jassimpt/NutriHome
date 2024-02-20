import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/basics.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/productsmodel.dart';

class WishlistItems extends StatelessWidget {
  const WishlistItems({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: prodcuctslist.length,
      itemBuilder: (context, index) {
        final ProductsModel product = prodcuctslist[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            height: size.height * 0.18,
            decoration: BoxDecoration(
                color: productbgcolor, borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        color: extrabgcolor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(
                      product.imageurl!,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          product.name!,
                          maxLines: 2,
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: fontcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "₹ ${product.price}",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: componentcolor),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SizedBox(
                              height: size.height * 0.04,
                              width: size.width * 0.3,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        componentcolor)),
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
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
