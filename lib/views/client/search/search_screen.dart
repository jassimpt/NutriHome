import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: GoogleFonts.urbanist(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: fontcolor),
                      ),
                      Row(
                        children: [
                          Text("Your favourite ",
                              style: GoogleFonts.urbanist(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: fontcolor)),
                          Text("Suppliments ",
                              style: GoogleFonts.urbanist(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: componentcolor)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: Consumer<FirestoreProvider>(
                    builder: (context, pro, child) => TextFormField(
                      onChanged: (value) {
                        pro.searchProducts(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.white.withOpacity(0.5),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          filled: true,
                          fillColor: productbgcolor,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ),
                )
              ],
            ),
          ),
          ProductsGrid(
            size: size,
          )
        ],
      ),
    );
  }
}
