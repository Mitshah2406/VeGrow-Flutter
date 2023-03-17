import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegrow/views/pages/introduction/introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    checkState();
  }

  void checkState()
  {
    Timer(const Duration(seconds: 3), (() => {
        Navigator.pushReplacement(context, new CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context)
        {
        
          return Introduction();
        }))
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: Text('Spalsghhh')),
    );
  }
}

