import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/cart/cartscreen.dart';
import 'package:nutrihome/views/client/home/homescree.dart';
import 'package:nutrihome/views/client/search/searchscreen.dart';
import 'package:nutrihome/views/client/wishlist/wishlistscreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedindex = 0;
  void pageChanger(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List pages = [
    const Homescreen(),
    const SearchScreen(),
    const CartScreen(),
    const WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: extrabgcolor,
        color: Colors.white,
        activeColor: componentcolor,
        gap: 8,
        haptic: true,
        selectedIndex: selectedindex,
        onTabChange: (value) => pageChanger(value),
        tabs: const [
          GButton(
            icon: Iconsax.home,
            text: 'Home',
          ),
          GButton(
            icon: Iconsax.search_favorite,
            text: "Search",
          ),
          GButton(
            icon: Iconsax.shopping_bag,
            text: "Cart",
          ),
          GButton(
            icon: Iconsax.heart4,
            text: "Wishlist",
          ),
        ],
      ),
      body: pages[selectedindex],
    );
  }
}
