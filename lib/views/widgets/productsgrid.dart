import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/basics.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/productsmodel.dart';
import 'package:nutrihome/views/detailsscreen.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: prodcuctslist.length,
        (context, index) {
          final ProductsModel products = prodcuctslist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(product: products),
                    ));
              },
              child: Container(
                width: size.width / 2,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    color: productbgcolor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width * 0.45,
                        height: size.height * 0.15,
                        decoration: const BoxDecoration(
                            color: extrabgcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(products.image!),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          products.name!,
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: fontcolor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "₹ ${products.price}",
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: componentcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
