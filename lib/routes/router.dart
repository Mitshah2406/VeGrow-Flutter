
import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';
import 'package:vegrow/views/pages/test.dart';

class AppRoutes {
  static List<GetPage> generateRoutes = [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/test", page: () => const Test()),
    GetPage(name: "/login", page: () =>  login()),
  ];
}
