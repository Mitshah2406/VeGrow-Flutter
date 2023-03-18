import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vegrow/routes/router.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/pages/Starter/splashScreenPage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      // home: Login(),
      getPages: AppRoutes.generateRoutes,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: SplashScreen(),
     
    );
  }
}

