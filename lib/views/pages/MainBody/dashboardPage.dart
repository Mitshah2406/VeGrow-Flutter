
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/MainBody/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/cartPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/categoriesPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/homePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/likePage.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index1 = 0;
  List tabs = [
    HomePage(),
    LikePage(),
    CategoriesPage(),
    CartPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index1],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            iconSize: 28,
            textSize: 26,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            gap: 8,
            tabBackgroundColor: Colors.green.shade500,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) => {
              index1 = index,
              setState(()=>{})
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Likes",
              ),
              GButton(
                icon: Icons.search,
                text: "Categories",
              ),
              GButton(
                icon: Icons.settings,
                text: "Cart",
              ),
              GButton(
                icon: Icons.account_circle,
                text: "Account",
              ),
            ]
          ),
        ),
      ),
    );
  }
}