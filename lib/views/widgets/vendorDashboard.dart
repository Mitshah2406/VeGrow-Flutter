// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:vegrow/controllers/productController.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';
// // import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:vegrow/consts/appConstant.dart';
// import 'package:vegrow/controllers/homeController.dart';
// import 'package:vegrow/main.dart';
// import 'package:vegrow/views/pages/MainBody/Farmers/tabs/Orders/orderPage.dart';
// import 'package:vegrow/views/pages/MainBody/Farmers/tabs/accountPage.dart';
// import 'package:vegrow/views/pages/MainBody/Farmers/tabs/home/homePage.dart';
// import 'package:vegrow/views/pages/MainBody/Farmers/tabs/ProducePage/listProducePage.dart';
// import 'package:bottom_navigation_bar/bottom_navigation_bar.dart';
// import 'package:animations/animations.dart';
// import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/homePage.dart';
// import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage1.dart';
// import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage2.dart';
// import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage3.dart';
// import 'package:vegrow/views/pages/Starter/popPage.dart';

// class vendorDashboardPage extends StatefulWidget {
//   vendorDashboardPage({super.key});

//   @override
//   State<vendorDashboardPage> createState() => _vendorDashboardPageState();
// }

// class _vendorDashboardPageState extends State<vendorDashboardPage> {
//   @override
//   void initState() {
//     super.initState();
//     final ProductController productController = Get.put(ProductController());
//   }

//   int _currentIndex = 0;
//   int _previousIndex = 0;
//   List<Widget> tabs = [
//     HomePage(),
//     ListProducePage(),
//     OrderPage(),
//     AccountPage()
//   ];

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> _pages = [
//       Navigator(
//         key: _navigatorKeys[0],
//         onGenerateRoute: (settings) =>
//             MaterialPageRoute(builder: (context) => vendorHomePage()),
//       ),
//       Navigator(
//         key: _navigatorKeys[1],
//         onGenerateRoute: (settings) =>
//             MaterialPageRoute(builder: (context) => tabPage1()),
//       ),
//       Navigator(
//         key: _navigatorKeys[2],
//         onGenerateRoute: (settings) =>
//             MaterialPageRoute(builder: (context) => tabPage2()),
//       ),
//       Navigator(
//         key: _navigatorKeys[3],
//         onGenerateRoute: (settings) =>
//             MaterialPageRoute(builder: (context) => tabPage3()),
//       ),
//     ];

//     return WillPopScope(
//         onWillPop: () async {
//           final currentState = _navigatorKeys[_currentIndex].currentState;
//           final canPop = currentState?.canPop() ?? false;

//           if (canPop) {
//             // if there are pages on the stack, pop them
//             currentState?.pop();
//             return false;
//           } else {
//             // if not on the first page of the current tab,
//             // then select the previous tab and show its last page
//             if (_currentIndex != 0) {
//               setState(() {
//                 _previousIndex = _currentIndex;
//                 _currentIndex = 0;
//               });
//               return false;
//             } else {
//               // if on the first page of the first tab, exit the app
//               return true;
//             }
//           }
//         },
//         child: Scaffold(
//           // body: PageTransitionSwitcher(
//           //   duration: const Duration(seconds: 1),
//           //   transitionBuilder: (child, primaryAnimation, secondaryAnimation){
//           //     return FadeThroughTransition(
//           //       animation: primaryAnimation,
//           //       secondaryAnimation: secondaryAnimation,
//           //       child: child,
//           //     );
//           //   },
//           //   child: tabs[_currentIndex],
//           // ),
//           body: IndexedStack(
//             index: _currentIndex,
//             children: _pages,
//           ),
//           bottomNavigationBar: Container(
//             color: Colors.white,
//             child: BottomNavigationBar(
//               selectedItemColor: Colors.green.shade500,
//               unselectedItemColor: Colors.black,
//               showSelectedLabels: true,
//               showUnselectedLabels: false,
//               backgroundColor: Colors.white,
//               onTap: (index) => {
//                 setState(() => {
//                       _currentIndex = index,
//                     })
//               },
//               currentIndex: _currentIndex,
//               items: const [
//                 BottomNavigationBarItem(
//                     label: "Home", icon: Icon(Icons.home), tooltip: "Home"),
//                 BottomNavigationBarItem(
//                     label: "List Produce",
//                     icon: Icon(Icons.list_alt),
//                     tooltip: "List Produce"),
//                 BottomNavigationBarItem(
//                     label: "Add Produce",
//                     icon: Icon(Icons.add),
//                     tooltip: "Add Produce"),
//                 BottomNavigationBarItem(
//                     label: "Account",
//                     icon: Icon(Icons.account_circle),
//                     tooltip: "Account"),
//               ],
//             ),
//           ),
//         )
//         // })
//         );
//   }
// }
