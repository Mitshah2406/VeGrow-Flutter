import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/views/pages/Starter/introductionPage.dart';

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
      // var pref = await SharedPreferences.getInstance();
      // var data = pref.getInt('count');
      // if(data != 1){
        // print("Hello");
      // }else{
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
          return IntroScreenPage();
        }));
      // }
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
