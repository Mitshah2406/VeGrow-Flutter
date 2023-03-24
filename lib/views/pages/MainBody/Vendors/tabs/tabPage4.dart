import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';

class tabPage4 extends StatefulWidget {
  const tabPage4({super.key});

  @override
  State<tabPage4> createState() => _tabPage4State();
}

class _tabPage4State extends State<tabPage4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(
          onPressed: (){
            AuthServices.deleteSession();
            Get.offNamed("/logout");
          },
          child: const Text("Logout")
        ),
    bottomNavigationBar: BottomNavVendor(index: 3,),
      ),
    );
  }
}
