import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/homeBody.dart';


class vendorHomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(homeController.farmerList.length);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavVendor(index: 0,),
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
