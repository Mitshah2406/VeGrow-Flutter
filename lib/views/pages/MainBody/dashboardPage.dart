import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
// import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/MainBody/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/cartPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/categoriesPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/homePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/ProducePage/listProducePage.dart';
import 'package:bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:animations/animations.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
final ProductController productController = Get.put(ProductController());

  }
  int _currentIndex = 0;
  int _previousIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    ListProducePage(),
    CategoriesPage(),
    AccountPage()
  ];

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
  final List<Widget> _pages = [
    Navigator(
      key: _navigatorKeys[0],
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) => HomePage()),
    ),
    Navigator(
      key: _navigatorKeys[1],
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) => ListProducePage()),
    ),
    Navigator(
      key: _navigatorKeys[2],
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) =>CategoriesPage()),
    ),
    Navigator(
      key: _navigatorKeys[3],
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (context) =>AccountPage()),
    ),
  ];

  

    return WillPopScope(
          onWillPop: () async {
          final currentState = _navigatorKeys[_currentIndex].currentState;
          final canPop = currentState?.canPop() ?? false;

          if (canPop) {
            // if there are pages on the stack, pop them
            currentState?.pop();
            return false;
          } else {
            // if not on the first page of the current tab,
            // then select the previous tab and show its last page
            if (_currentIndex != 0) {
              setState(() {
                _previousIndex = _currentIndex;
                _currentIndex = 0;
              });
              return false;
            } else {
              // if on the first page of the first tab, exit the app
              return true;
            }
          }
        },
        child: Scaffold(
          // body: PageTransitionSwitcher(
          //   duration: const Duration(seconds: 1),
          //   transitionBuilder: (child, primaryAnimation, secondaryAnimation){
          //     return FadeThroughTransition(
          //       animation: primaryAnimation,
          //       secondaryAnimation: secondaryAnimation,
          //       child: child,
          //     );
          //   },
          //   child: tabs[_currentIndex],
          // ),
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: BottomNavigationBar(
              selectedItemColor: Colors.green.shade500,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              onTap: (index) => {
                setState(() => {
                    _currentIndex = index,
                })
              },
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.home), tooltip: "Home"),
                BottomNavigationBarItem(
                    label: "List Produce",
                    icon: Icon(Icons.list_alt),
                    tooltip: "List Produce"),
                BottomNavigationBarItem(
                    label: "Add Produce",
                    icon: Icon(Icons.add),
                    tooltip: "Add Produce"
                ),
                BottomNavigationBarItem(
                    label: "Account",
                    icon: Icon(Icons.account_circle),
                    tooltip: "Account"),
              ],
            ),
          ),
        )
      // })
    );
  }
}
