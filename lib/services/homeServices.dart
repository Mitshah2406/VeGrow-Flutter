import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Product.dart';
import 'package:vegrow/models/auth/Farmer.dart';

class HomeServices{
   static Future<Map> getFarmerData(farmerId, token) async {
    print(farmerId);
    print(token);
    print("Hello");
    try {
      var response = await http.post(
        Uri.parse("${AppConstant.IP}/authentication/specificFarmerData/"),
        headers: {"Authorization":"Bearer ${token}"},
        body: jsonEncode(
          {
          "id": farmerId
        })
      );
      print(response.body);
      var decoded = jsonDecode(response.body);
      // print(decoded['location']['lat']);
      print("Hellllllllooooooooo");

      return decoded;

      // return farmerFromJson(response.body);
    } catch (e) {
      print(e);
      return {"error": e};
    }
  }

    static Future<Map> getVendorData(vendorId, token) async {
    print(vendorId);
    print(token);
    print("Hello");
    try {
      var response = await http.post(
        Uri.parse("${AppConstant.IP}/authentication/specificVendorData/"),
        headers: {"Authorization":"Bearer ${token}"},
        body: jsonEncode(
          {
          "id": vendorId
        })
      );
      print(response.body);
      var decoded = jsonDecode(response.body);
      print("Hellllllllooooooooo");

      return decoded;
    } catch (e) {
      print(e);
      return {"error": e};
    }
  }
  
}