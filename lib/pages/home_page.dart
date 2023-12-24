import 'package:ecommerce_test/pages/shop_page.dart';
import 'package:ecommerce_test/pages/stationary_page.dart';
import 'package:flutter/material.dart';
import '../utils/bottom_navbar.dart';
import 'cart_page.dart';
import 'fashion_page.dart';
import 'household_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  void navigatenavbar(int index){
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> pages = [
    const shoppage(),
    const fashionpage(),
    const householdpage(),
    const stationarypage(),
    const cartpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 8),
            Text(
              '123 Main St, City',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(icon:
          const Icon(
            Icons.menu,
            color: Colors.black,
          ),
            onPressed: () => {Scaffold.of(context).openDrawer()},),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 75),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.black,),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.black,),
                  title: Text(
                    "Cart",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.contact_support, color: Colors.black,),
                  title: Text(
                    "Support",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomnavbar(
        onTabChange: (index) => navigatenavbar(index),
      ),
      body: pages[_selectedindex],
    );
  }
}
