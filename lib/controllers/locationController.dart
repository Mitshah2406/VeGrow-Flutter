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


      // if(lat == null || long == null || placemarks[0] == null){
      //   return "not found";
      // }

      // if(id == null && token1 == null){
      //   print("My user Data");
      // var myUser = await SessionManager().get('user');
      // print(myUser);
        // var farmerData = await SessionManager().get('user');
        // var farmerId = farmerData['id'];
        // var token = farmerData['token'];
        // var response = await LocationServices.sendLocation(token, lat, long, placemarks[0].postalCode, farmerId, placemarks[0].locality, placemarks[0].subLocality);

        // return response;
      // }else{
      //   print("My user Data");
      // var myUser = await SessionManager().get('user');
      // print(myUser);
        // var farmerId = await SessionManager().get('farmerId');
        // var token = await SessionManager().get('token');
        // var response = await LocationServices.sendLocation(token['token'], lat, long, placemarks[0].postalCode, farmerId, placemarks[0].locality, placemarks[0].subLocality);

        // return response;
      // }
    } catch (e) {
      print(e);
      return e.toString();
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
          // var token = await SessionManager().get('token');
          // var farmerId = await SessionManager().get('farmerId');
            print("My user Data in resgister");
            var myUser = await SessionManager().get('user');
            print(myUser);
          Future<String?> l = LocationController().determinePosition();
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
