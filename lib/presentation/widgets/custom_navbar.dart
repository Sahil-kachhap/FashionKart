import 'package:fashion_kart/presentation/constants.dart';
import 'package:fashion_kart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: GNav(
          selectedIndex: 0,
          gap: 8,
          tabBackgroundColor: const Color(0xffEFF0F3),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(
              top: 15, bottom: 15, left: 21.2, right: 20),
          tabBorderRadius: 18,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          activeColor: Colors.black,
          iconSize: 20,
          textStyle: const TextStyle(
            fontSize: Constants.size12,
            fontWeight: Constants.regularText,
          ),
          onTabChange: (index) {
            if(index == 1){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            }
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
          ]),
    );
  }
}
