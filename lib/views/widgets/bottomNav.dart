// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:vegrow/consts/appConstant.dart';

class BottomNavVendor extends StatefulWidget {
  final int index;
  const BottomNavVendor({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  State<BottomNavVendor> createState() => _BottomNavVendorState();
}

class _BottomNavVendorState extends State<BottomNavVendor> {
  @override
  int indexx = 1;
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(
          left: AppConstant.kDefaultPadding * 2,
          right: AppConstant.kDefaultPadding * 2,
          // bottom: AppConstant.kDefaultPadding,
        ),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, -10),
          //     blurRadius: 35,
          //     color: AppConstant.kPrimaryColor.withOpacity(0.38),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/flower.svg",
                  color: {widget.index} == 0
                      ? AppConstant.kPrimaryColor
                      : Colors.black54),
              onPressed: () {
                Get.toNamed('/vendorHomePage');
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/search3.svg",
                  color: {widget.index} == 1
                      ? AppConstant.kPrimaryColor
                      : Colors.black54),
              onPressed: () {
                Get.toNamed('/tabPage2');
              },
            ),
            // IconButton(
            //   icon: SvgPicture.asset("assets/icons/myBids.svg",
            //       color: {widget.index} == 1
            //           ? AppConstant.kPrimaryColor
            //           : Colors.black54),
            //   onPressed: () {
            //     Get.toNamed('/tabPage2');
            //   },
            // ),
            // IconButton(
            //   icon: SvgPicture.asset("assets/icons/orders.svg",
            //       color: {widget.index} == 1
            //           ? AppConstant.kPrimaryColor
            //           : Colors.black54),
            //   onPressed: () {
            //     Get.toNamed('/tabPage2');
            //   },
            // ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/user-icon.svg",
                  color: {widget.index} == 2
                      ? AppConstant.kPrimaryColor
                      : Colors.black54),
              onPressed: () {
                Get.toNamed('/tabPage3');
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/circle-user.svg",
                  color: {widget.index} == 2
                      ? AppConstant.kPrimaryColor
                      : Colors.black54),
              onPressed: () {
                Get.toNamed('/tabPage4');
              },
            )
          ],
        ),
      ),
    );
  }
}
