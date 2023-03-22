import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      var data = pref.getBool('show');
      print(data);

      // Session Data
      var sessionData = await AuthServices.getSession();

      if(sessionData){
        Get.offNamed('/dashboard');
      }else if(data == true){
        Get.offNamed('/welcome');
      }else{
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
                  textStyle: TextStyle(
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
