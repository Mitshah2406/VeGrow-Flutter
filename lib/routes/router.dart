
import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/introduction/splashScreenPage.dart';
import 'package:vegrow/views/pages/test.dart';

// class Router{
//   static List generateRoutes = [
//     GetPage(name: "/", page: ()=> Home()),
//     // GetPage(name: "/splashScreen", page: ()=> SplashScreen()),
//     // GetPage(name: "/homePage", page: ()=> HomePage()),
//   ];
// }

class AppRoutes {
  static List<GetPage> generateRoutes = [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/test", page: () => const Test()),
    // GetPage(name: "/home", page: () => const ()),
    // GetPage(name: "/home", page: () => const ()),
  ];
}
