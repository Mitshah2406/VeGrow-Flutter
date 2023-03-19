
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/routes/router.dart';
import 'package:vegrow/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:vegrow/controllers/auth/idController.dart';
import 'package:vegrow/routes/router.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';
// import 'package:vegrow/views/pages/Authentication/login.dart';
// import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';

// void main() {
//   runApp(Home());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final IdController idController = Get.put(IdController());
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final ThemeController themeC = Get.put(ThemeController());

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeC.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: AppRoutes.generateRoutes,
    );
  }
}

