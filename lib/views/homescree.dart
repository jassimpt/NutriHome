import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/basics.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/categoriesmode.dart';
import 'package:nutrihome/model/productsmodel.dart';
import 'package:nutrihome/views/profilescreen.dart';
import 'package:nutrihome/views/widgets/customdrawerbutton.dart';
import 'package:nutrihome/views/widgets/postercarousal.dart';
import 'package:nutrihome/views/widgets/productsgrid.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDrawerButton(
                      size: size,
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/menu.png',
                        height: 30,
                      ),
                    ),
                    CustomDrawerButton(
                      size: size,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                      child: Text(
                        'A',
                        style: GoogleFonts.bangers(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: GoogleFonts.urbanist(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: fontcolor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Welcome to ",
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: fontcolor,
                          ),
                        ),
                        Text(
                          "Nutrihome",
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
              PosterCarousal(size: size),
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
        ProductsGrid(size: size),
      ]),
    );
  }
}
