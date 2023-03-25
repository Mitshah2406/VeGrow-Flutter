import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/dashboardPage.dart';
import 'package:vegrow/views/pages/Authentication/register.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/singleProductView.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/homePage.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage2.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage3.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/tabPage4.dart';
import 'package:vegrow/views/widgets/vendorDashboard.dart';
import 'package:vegrow/views/pages/Starter/introductionPage.dart';
import 'package:vegrow/views/pages/Starter/welcome.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';
import '../views/pages/Authentication/otpScreen.dart';
import '../views/pages/MainBody/Farmers/tabs/Orders/orderPage.dart';
import '../views/pages/MainBody/Farmers/tabs/Orders/singleOrderPage.dart';
import '../views/pages/MainBody/Farmers/tabs/ProducePage/listProducePage.dart';
import '../views/pages/MainBody/Farmers/tabs/ProducePage/singleProducePage.dart';
import '../views/pages/MainBody/Farmers/tabs/addProducePage.dart';
import '../views/pages/MainBody/Farmers/tabs/home/homePage.dart';
import '../views/pages/MainBody/Farmers/tabs/home/locationPage.dart';

class AppRoutes {
  static List<GetPage> generateRoutes = [
    GetPage(name: "/", page: () => SingleProductView()),
    GetPage(name: "/introduction", page: () => const IntroScreenPage()),
    GetPage(name: "/welcome", page: () =>  Welcome(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/login", page: () =>  Login()),
    GetPage(name: "/sendOtp/:verificationId", page: () =>  OtpScreen()),
    GetPage(name: "/register/:number", page: () =>  Register()),
    GetPage(name: "/logout", page: () =>  Welcome(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    
    // Farmer Dashboard
    GetPage(name: "/farmerDashboard", page: () => farmerDashboardPage(),  transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/home", page: () => HomePage()),
    GetPage(name: "/likes", page: () => ListProducePage()),
    GetPage(name: "/logout", page: () =>  Welcome()),
    GetPage(name: "/categories", page: () => AddProducePage()),
    // GetPage(name: "/cart", page: () => CartPage()),
    GetPage(name: "/account", page: () => AccountPage()),

    GetPage(name: "/location", page: () => LocationPage(), transition: Transition.leftToRightWithFade, transitionDuration: const Duration(milliseconds: 500)),
    
    // GetPage(name: "/addProduct", page: () => addProductPage(), transition: Transition.downToUp, transitionDuration: const Duration(milliseconds: 300)),

    GetPage(name: "/singleProducePage", page: () => SingleProducePage()),
    GetPage(name: "/orderPage", page: () => const OrderPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/singleOrder", page: () => const SingleOrderPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 400)),


    // Vendor Dashboard
    // GetPage(name: "/vendorDashboard", page: () => vendorDashboardPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 400)),
    GetPage(name: "/vendorHomePage", page: () => vendorHomePage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/tabPage2", page: () => const tabPage2(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/tabPage3", page: () => const tabPage3(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/tabPage4", page: () => const tabPage4(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/singleProductView", page: () => SingleProductView(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500))
    
  ];
}
