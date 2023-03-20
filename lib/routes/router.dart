
import 'package:get/route_manager.dart';
import 'package:vegrow/main.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/Authentication/register.dart';
import 'package:vegrow/views/pages/Starter/introductionPage.dart';
import 'package:vegrow/views/pages/Starter/welcome.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';
import 'package:vegrow/views/pages/hometest.dart';
import 'package:vegrow/views/pages/test.dart';

import '../views/pages/Authentication/otpScreen.dart';

class AppRoutes {
  static List<GetPage> generateRoutes = [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/introduction", page: () => const IntroScreenPage()),
    GetPage(name: "/test", page: () => const Test()),
    GetPage(name: "/welcome", page: () =>  Welcome()),
    GetPage(name: "/login", page: () =>  Login()),
    GetPage(name: "/sendOtp/:verificationId", page: () =>  OtpScreen()),
    GetPage(name: "/register/:number", page: () =>  Register()),
    GetPage(name: "/home", page: () =>  HomeTest()),
    GetPage(name: "/logout", page: () =>  Welcome()),
    // GetPage(name: "/recieveOtp", page: () =>  Otp()),
  ];
}
