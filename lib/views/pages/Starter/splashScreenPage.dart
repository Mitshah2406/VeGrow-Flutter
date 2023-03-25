import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/services/authServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showIntro();
  }

  void showIntro() {
    var timer = Timer(const Duration(seconds: 3), () async {
      var pref = await SharedPreferences.getInstance();
      AppConstant.prefs = pref;
      var data = pref.getBool('show');
      pref.setString('language', "en");
      print(data);

      // Session Data
      var sessionData = await AuthServices.getSession();
      var result = await SessionManager().get('user');

      if (sessionData) {
        if(result['role'] == "farmer"){
         Get.offNamed('/farmerDashboard');
        }else{
         Get.offNamed('/vendorHomePage');
        }
      } else if (data == true) {
        Get.offNamed('/welcome');
      } else {
        Get.offNamed('/introduction');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.only(top: 47),
          child: Center(
            child: SizedBox(
              child: Center(
                child: TextLiquidFill(
                  boxBackgroundColor: Colors.black,
                  text: "VeGrow",
                  textStyle: const TextStyle(
                      fontFamily: 'Specimen',
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                  ),
                  waveColor: Colors.white,
                  waveDuration: const Duration(seconds: 2),
                  loadDuration: const Duration(seconds: 3),
                ),
              ),
            ),
          ),
        ));
  }
}
