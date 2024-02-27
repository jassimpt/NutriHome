import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/model/products_model.dart';
import 'package:provider/provider.dart';

class WishlistItems extends StatelessWidget {
  const WishlistItems({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FirestoreProvider>(builder: (context, value, child) {
      if (value.wishlist.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.wishlist.length,
          itemBuilder: (context, index) {
            final ProductsModel product = value.wishlist[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width,
                height: size.height * 0.18,
                decoration: BoxDecoration(
                    color: productbgcolor,
                    borderRadius: BorderRadius.circular(15)),
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
                          child: Image.network(product.imageurl!)),
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: SizedBox(
                                  height: size.height * 0.04,
                                  width: size.width * 0.3,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                componentcolor)),
                                    onPressed: () {
                                      addToCart(
                                          context: context,
                                          category: product.category,
                                          flavour: product.flavour,
                                          howtouse: product.howtouse,
                                          imageurl: product.imageurl,
                                          name: product.name,
                                          price: product.price,
                                          quantity: value.quantity,
                                          serving: product.serving,
                                          totalservings: product.totalservings,
                                          weight: product.weight);
                                    },
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
                                  onPressed: () {
                                    value.deleteWishlistItem(
                                        productname: product.name!);
                                  },
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
      } else {
        return Center(
          child: LottieBuilder.asset(
              "assets/lottie/Animation - 1709009620778.json"),
        );
      }
    });
  }

  addToCart(
      {required BuildContext context,
      required category,
      required flavour,
      required howtouse,
      required imageurl,
      required name,
      required price,
      required quantity,
      required serving,
      required totalservings,
      required weight}) {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);

    CartItemModel product = CartItemModel(
      category: category,
      flavour: flavour,
      howtouse: howtouse,
      imageurl: imageurl,
      name: name,
      price: price,
      quantity: quantity,
      serving: serving,
      totalservings: totalservings,
      weight: weight,
    );
    pro.addToCart(product: product, productname: name);
  }
}
