import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/basics.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/categories_model.dart';
import 'package:nutrihome/views/Admin/home/product_add_screen.dart';
import 'package:nutrihome/views/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({
    super.key,
  });

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchProducts();
  }

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Consumer<AuthProvider>(
                          builder: (context, value, child) => Container(
                            width: size.width * 0.13,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                color: productbgcolor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    value.signOut();
                                  },
                                  icon: const Icon(
                                    Iconsax.logout,
                                    color: fontcolor,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                      child: Consumer<FirestoreProvider>(
                        builder: (context, pro, child) => SizedBox(
                          width: size.width * 0.7,
                          child: TextFormField(
                            onChanged: (value) {
                              pro.searchProducts(value);
                            },
                            style: const TextStyle(color: Colors.white),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductAddScreen(),
                            ));
                      },
                      child: Container(
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
                      ),
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
        ProductsGrid(
          size: size,
        ),
      ]),
    );
  }
}
