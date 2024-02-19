import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nutrihome/helpers/basics.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/categoriesmode.dart';
import 'package:nutrihome/views/client/home/widgets/postercarousal.dart';
import 'package:nutrihome/views/widgets/productsgrid.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin',
                        style: GoogleFonts.urbanist(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: fontcolor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Lets manage ",
                            style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: fontcolor,
                            ),
                          ),
                          Text(
                            "the products",
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: Colors.white.withOpacity(0.5),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              filled: true,
                              fillColor: productbgcolor,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: componentcolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: fontcolor,
                        size: 30,
                      )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Text(
                    "Categories",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fontcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      CategoriesModel categorie = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: size.height * 0.08,
                              decoration: BoxDecoration(
                                color: productbgcolor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: size.width * 0.1,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: extrabgcolor,
                                  image: DecorationImage(
                                    image: AssetImage(categorie.image!),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 55,
                              child: Text(
                                categorie.category!,
                                style: GoogleFonts.urbanist(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: fontcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        ProductsGrid(size: size),
      ]),
    );
  }
}
