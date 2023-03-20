import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/MainBody/dashboardPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/ProducePage/singleProducePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/accountPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/cartPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/categoriesPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/addProductPage.dart';
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
    GetPage(name: "/welcome", page: () =>  Welcome()),
    GetPage(name: "/login", page: () =>  Login()),
    GetPage(name: "/sendOtp/:verificationId", page: () =>  OtpScreen()),
    GetPage(name: "/register/:number", page: () =>  Register()),
    GetPage(name: "/logout", page: () =>  Welcome()),
    
    // Atharva
    GetPage(name: "/dashboard", page: () => DashboardPage()),
    GetPage(name: "/home", page: () => HomePage()),
    GetPage(name: "/likes", page: () => ListProducePage()),
    GetPage(name: "/logout", page: () =>  Welcome()),
    GetPage(name: "/categories", page: () => CategoriesPage()),
    GetPage(name: "/cart", page: () => CartPage()),
    GetPage(name: "/account", page: () => AccountPage()),

    GetPage(name: "/location", page: () => LocationPage(), transition: Transition.leftToRightWithFade, transitionDuration: const Duration(milliseconds: 500)),
    
    GetPage(name: "/addProduct", page: () => addProductPage(), transition: Transition.downToUp, transitionDuration: const Duration(milliseconds: 300)),

    GetPage(name: "/singleProducePage", page: () => SingleProducePage())
  ];
}
