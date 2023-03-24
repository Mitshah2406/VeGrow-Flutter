import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/widgets/myBottomNavBar.dart';

class tabPage3 extends StatefulWidget {
  const tabPage3({super.key});

  @override
  State<tabPage3> createState() => _tabPage3State();
}

class _tabPage3State extends State<tabPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Container(
          padding: EdgeInsets.only(
            left: AppConstant.kDefaultPadding * 2,
            right: AppConstant.kDefaultPadding * 2,
            // bottom: AppConstant.kDefaultPadding,
          ),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -10),
                blurRadius: 35,
                color: AppConstant.kPrimaryColor.withOpacity(0.38),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset("assets/icons/flower.svg"),
                onPressed: () {
                  Get.toNamed('/vendorHomePage');
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
                onPressed: () {
                  Get.toNamed('/tabPage2');
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/user-icon.svg", color: AppConstant.kPrimaryColor,),
                onPressed: () {
                  Get.toNamed('/tabPage3');
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/circle-user.svg"),
                onPressed: () {
                  Get.toNamed('/tabPage4');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
