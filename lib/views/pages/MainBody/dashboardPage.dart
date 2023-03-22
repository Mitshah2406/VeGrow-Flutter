import 'dart:convert';

import 'package:flutter/material.dart';
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
  // final HomeController homeController = Get.put(HomeController());
  int index1 = 0;
  List tabs = [
    HomePage(),
    ListProducePage(),
    CategoriesPage(),
    AccountPage()
  ];
  
  
  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   child: Scaffold(
    //   body: tabs[index1],
    //   bottomNavigationBar: Container(
    //     color: Colors.white,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    //       child: GNav(
    //         iconSize: 32,
    //         textSize: 28,
    //         backgroundColor: Colors.white,
    //         color: Colors.black,
    //         activeColor: Colors.white,
    //         gap: 8,
    //         tabBackgroundColor: Colors.green.shade500,
    //         padding: const EdgeInsets.all(16),
    //         onTabChange: (index) => {
    //           setState(()=>{
    //             index1 = index,
    //           })
    //         },
    //         tabs: const [
    //           GButton(
    //             icon: Icons.home,
    //             text: "Home",
    //             textStyle: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white
    //             ),
    //           ),
    //           GButton(
    //             icon: Icons.list_alt,
    //             text: "List Produce",
    //             textStyle: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white
    //             ),
    //           ),
    //           GButton(
    //             icon: Icons.search,
    //             text: "Categories",
    //             textStyle: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white
    //             ),
    //           ),
    //           GButton(
    //             icon: Icons.settings,
    //             text: "Cart",
    //             textStyle: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white
    //             ),
    //           ),
    //           GButton(
    //             icon: Icons.account_circle,
    //             text: "Account",
    //             textStyle: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white
    //             ),
    //           ),
    //         ]
    //       ),
    //     ),
    //   ),
    // ),
    //   onWillPop: () async {
    //     final value = await  showDialog<bool>(
    //       context: context,
    //       builder: (context){
    //         return AlertDialog(
    //           title: Text("Really??"),
    //           content: Text("Do you want to exit?"),
    //           actions: [
    //             ElevatedButton(onPressed: (){
    //               Navigator.of(context).pop(false);
    //             }, child: Text("No")),
    //             ElevatedButton(onPressed: (){
    //               Navigator.of(context).pop(false);
    //             }, child: Text("Exit"))
    //           ],
    //         );
    //       }
    //     );
    //     if(value!=null){
    //       return Future.value(value);
    //     }else{
    //       return Future.value(false);
    //     }
    //   }
    //  );
    return popPage(
        page: Scaffold(
          body: PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation){
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: tabs[index1],
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
                    index1 = index,
                })
              },
              currentIndex: index1,
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
