import 'dart:async';
import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:vegrow/services/locationServices.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var isloading = true.obs;

  Future<String?> determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return "false";
      }
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var lat = position.latitude;
      var long = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      print(placemarks[0].subLocality);
      print(placemarks[0].locality);
      print(lat);
      print(long);

      print("My user Data");
      var myUser = await SessionManager().get('user');
      print(myUser);

      var farmerId = myUser['id'];
      var token = myUser['token'];
      print("Farmer Id");
      print(farmerId);
      print("Tokem");
      print(token);

      isloading(true);
      var response = await LocationServices.sendLocation(token, lat, long, placemarks[0].postalCode, farmerId, placemarks[0].locality, placemarks[0].subLocality);
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    } finally {
      isloading(false);
    }
  }

  static Future<String?> promptLocation() async {
    print("In prompt location");
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return "Denied";
      }else{
        PermissionStatus status = await Permission.location.request();
        if(status.isGranted){
            print("My user Data in resgister");
            var myUser = await SessionManager().get('user');
            print(myUser);
            await LocationController().determinePosition();
          return "Access";
        }else if(status.isPermanentlyDenied){
          openAppSettings();
        }
      }
       
    } catch (e) {
      return e.toString();
    }
  }
}
