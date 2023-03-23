import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:vegrow/consts/appConstant.dart';

class LocationServices{
  static Future<String?> sendLocation(token, lat, long, pinCode, farmerId, locality, sublocality) async {
    try {
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
            "long": long,
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
    } catch (e) {
      return e.toString();
    }
  } 
}