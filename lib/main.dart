import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/routes/router.dart';
import 'package:vegrow/themes/themes.dart';
// import 'package:vegrow/views/pages/Authentication/login.dart';
// import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
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

