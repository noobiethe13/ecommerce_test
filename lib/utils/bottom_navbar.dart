import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomnavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: GNav(
          backgroundColor: Colors.grey,
          iconSize: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          color: Colors.white,
          activeColor: Colors.black,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.indigo.shade50,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(icon: Icons.home,
              text: "Home",),
            GButton(icon: FontAwesomeIcons.shirt,
            text: "Fashion",),
            GButton(icon: FontAwesomeIcons.basketShopping,
            text: "Household",),
            GButton(icon: FontAwesomeIcons.book,
            text: "Stationary",),
            GButton(icon: Icons.shopping_cart,
              text: "Cart",),
          ],
        ),
      ),
    );
  }
}

