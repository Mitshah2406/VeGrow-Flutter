import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';

class tabPage3 extends StatefulWidget {
  const tabPage3({super.key});

  @override
  State<tabPage3> createState() => _tabPage3State();
}

class _tabPage3State extends State<tabPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("hi"), bottomNavigationBar: BottomNavVendor(index:2));
  }
}
