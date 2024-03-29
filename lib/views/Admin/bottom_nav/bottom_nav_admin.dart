import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/Admin/all_users/all_users.dart';
import 'package:nutrihome/views/Admin/home/admin_home.dart';
import 'package:nutrihome/views/Admin/orders/orders_admin.dart';

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  int selectedindex = 0;
  void pageChanger(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List pages = [
    const AdminHome(),
    const OrdersAdmin(),
    const AllUsers(),
    // const WishListScreen()
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
            icon: Iconsax.shopping_bag,
            text: "Orders",
          ),
          GButton(
            icon: Iconsax.user,
            text: "Users",
          ),
        ],
      ),
      body: pages[selectedindex],
    );
  }
}
