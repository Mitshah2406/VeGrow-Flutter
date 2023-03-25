import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:vegrow/themes/themes.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';
import 'package:vegrow/views/widgets/profilePageOptions.dart';
import 'dart:math';

import 'package:vegrow/views/widgets/waveCliper.dart';

import '../../../../widgets/buttonRow.dart';

class tabPage4 extends StatefulWidget {
 const tabPage4({super.key});

  @override
  State<tabPage4> createState() => _tabPage4State();
}

class _tabPage4State extends State<tabPage4> {
  dynamic data ='';
  @override
  void initState() {
    // TODO: implement initState
    callSession();
    super.initState();
  }
  void callSession() async{
   data =await AuthServices.getCurrentSession();
   print("data");
   print(data);

  }
   @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavVendor(index: 3),
      body: Container(
          height: MediaQuery.of(context).size.height,
          // color: Colors.amber,
          child: Stack(children: [
            Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  actions: [
                    IconButton(
                        onPressed: () {
                          if (Get.isDarkMode) {
                            Get.changeTheme(ThemeManager.lightTheme);
                          } else {
                            Get.changeTheme(ThemeManager.darkTheme);
                          }
                          ;
                        },
                        icon: Icon(Icons.sunny))
                  ],
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  title: Text("Profile".tr),
                  centerTitle: true,
                ),
                ClipPath(
                    clipper: CustomShape(),
                    child: SizedBox(
                      height: 240,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              ],
            ),
            Positioned.fill(
              bottom: 400,
              child: Align(
                alignment: Alignment.center,
                child: CircularProfileAvatar(
                  '',
                  child: Image.asset(AppConstant.vendor),
                  borderColor: Theme.of(context).primaryColorLight,
                  borderWidth: 5,
                  elevation: 3,
                  radius: 80,
                ),
              ),
            ),
            Positioned.fill(
                bottom: 175,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      data['fName'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
            Positioned.fill(
                bottom: 130,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      data['email'],
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ))),
            Positioned.fill(
                bottom: -10,
                child: Align(
                  alignment: Alignment.center,
                  child: buttonRow(),
                )),
            Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: optionsCard(),
                ))
          ])),
    );
  }
}
