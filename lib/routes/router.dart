import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/MainBody/dashboardPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/Orders/orderPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/Orders/singleOrderPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/ProducePage/singleProducePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/addProducePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/homePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/locationPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/ProducePage/listProducePage.dart';
import 'package:vegrow/views/pages/Authentication/register.dart';
import 'package:vegrow/views/pages/Starter/introductionPage.dart';
import 'package:vegrow/views/pages/Starter/welcome.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';
import '../views/pages/Authentication/otpScreen.dart';

class AppRoutes {
  static List<GetPage> generateRoutes = [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/introduction", page: () => const IntroScreenPage()),
    GetPage(name: "/welcome", page: () =>  Welcome(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: "/login", page: () =>  Login()),
    GetPage(name: "/sendOtp/:verificationId", page: () =>  OtpScreen()),
    GetPage(name: "/register/:number", page: () =>  Register()),
    GetPage(name: "/logout", page: () =>  Welcome(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
    
    // Atharva
    GetPage(name: "/dashboard", page: () => DashboardPage()),
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
    GetPage(name: "/singleOrder", page: () => const SingleOrderPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 400))

  ];
}
