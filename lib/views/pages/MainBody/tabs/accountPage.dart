import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/themes/themes.dart';
import '../../../widgets/buttonRow.dart';
import '../../../widgets/profilePageOptions.dart';
import '../../../widgets/waveCliper.dart';
import 'dart:math';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                  child: FlutterLogo(),
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
                      "Mit Shah",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
            Positioned.fill(
                bottom: 130,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "farmer@124",
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
