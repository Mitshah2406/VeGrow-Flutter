import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';

class tabPage2 extends StatefulWidget {
  const tabPage2({super.key});

  @override
  State<tabPage2> createState() => _tabPage2State();
}

class _tabPage2State extends State<tabPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hi"),
      bottomNavigationBar:const BottomNavVendor(index:1)
    );
  }
}