import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vegrow/controllers/locationController.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationController locationController = Get.put(LocationController());


  Future<String?> getLocationManually() async {
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
       Fluttertoast.showToast(
          msg: "Please Enabled your location from the device",
          fontSize: 18,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red
        );
    }else{
      PermissionStatus status = await Permission.location.request();
      if(status.isGranted){
        print("My user Data in resgister");
        var myUser = await SessionManager().get('user');
        print(myUser);
        var l = await LocationController().determinePosition();
        if(l == "Done"){
          Fluttertoast.showToast(
            msg: "Your location has been detected",
            fontSize: 18,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green
          );
          Get.toNamed('/dashboard');
        }else{
          Fluttertoast.showToast(
            msg: "Your location detected",
            fontSize: 18,
            textColor: Colors.red,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red
          );
        }
      }else if(status.isPermanentlyDenied){
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green.shade500,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select Location",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  iconSize: 40,
                  icon: const Icon(Icons.close, color: Colors.white))
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 15.0, end: 15.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black87,
                      ),
                    ),
                    hintText: "Enter your location",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   child: Obx((){
                  //   if(locationController.isloading.value){
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }else{
                  //     return const Center(
                  //       child: Text("Location Fetched"),
                  //     );
                  //   }
                  // }),
                  // ),
                  const Icon(
                    Icons.near_me,
                    color: Colors.purple,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      var result = getLocationManually();
                      print(result);

                      
                    },
                    child: const Text(
                      "Use current location",
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ));
  }
}
