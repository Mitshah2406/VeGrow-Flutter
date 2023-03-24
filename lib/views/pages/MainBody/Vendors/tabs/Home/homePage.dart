import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/homeBody.dart';
import 'package:vegrow/views/widgets/myBottomNavBar.dart';

class vendorHomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(homeController.farmerList.length);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
    ;
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
