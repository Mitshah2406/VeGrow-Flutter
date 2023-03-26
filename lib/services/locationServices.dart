import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:vegrow/consts/appConstant.dart';

class LocationServices{
  static Future<String?> sendLocation(role, token, lat, long, pinCode, farmerId, locality, sublocality) async {
    try {
      if(role == "farmer"){
        var response = await http.post(
          Uri.parse('${AppConstant.IP}/authentication/addFarmerLocationDetails/'),
          headers: {
            "Authorization": "Bearer ${token}"
          },
          body: jsonEncode(
            {
            "id": farmerId,
            "location": {
              "lat": lat,
              "lon": long,
              "pinCode": pinCode,
              "locality": locality,
              "sublocality": sublocality
            }
          }
          )
        );
        print("In siervices");
        print(token);
        return "Done";
      }else{
        print("In Vendor Boisssss");
        print(token);
        print(farmerId);
        print("Vendro One");
        print(lat);
         var response = await http.post(
          Uri.parse('${AppConstant.IP}/authentication/addVendorLocationDetails/'),
          headers: {
            "Authorization": "Bearer ${token}"
          },
          body: jsonEncode(
            {
            "id": farmerId,
            "location": {
              "lat": lat,
              "lon": long,
              "pinCode": pinCode,
              "locality": locality,
              "sublocality": sublocality
            }
          }
          )
        );
        print("In siervices");
        print(token);
        return "Done";
      }

    } catch (e) {
      return e.toString();
    }
  } 
}