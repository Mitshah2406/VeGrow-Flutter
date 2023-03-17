import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vegrow/routes/router.dart';
import 'package:vegrow/views/pages/introduction/splashScreenPage.dart';
import 'package:vegrow/routes/router.dart';
void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: AppRoutes.generateRoutes,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: SplashScreen(),
     
    );
  }
}

