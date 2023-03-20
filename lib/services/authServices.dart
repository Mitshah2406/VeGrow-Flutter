import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Session/Token.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/models/auth/Vendor.dart';

class AuthServices {
  
  static Future<bool> registerUser(id, name, email, number, role) async {
    try {
      String url = role == 0
          ? "${AppConstant.Ip}/authentication/farmerSignUp/"
          : "${AppConstant.Ip}/authentication/vendorSignUp/";

      var response = await http.post(
          Uri.parse(
            url,
          ),
          body: jsonEncode({
            "id": id,
            "fName": name,
            "lName": name,
            "phone": "+919653288604",
            "email": email,
          }));

      var recvdToken = jsonDecode(response.body)['token'];
      Token token = Token(token: recvdToken);

      var sessionManager = SessionManager();
      await sessionManager.set("token", token);
      dynamic data = await SessionManager().get("token");
      print(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkIfUserExists(phone) async {
    print(phone);
    var response = await http.post(
        Uri.parse(
          "${AppConstant.Ip}/authentication/phoneNumberCheck/",
        ),
        body: jsonEncode({"phone": phone}));

    var recvdToken = jsonDecode(response.body)['exist'];
    var decodedResponse = jsonDecode(response.body);
    if (recvdToken == false) {
      return false;
    } else {
      if (decodedResponse['role'].toString().toLowerCase() == 'farmer') {
        Farmer farmer = Farmer(
            exist: decodedResponse['exist'],
            token: decodedResponse['token'],
            role: decodedResponse['role'],
            farmer: decodedResponse['farmer'],
            fName: decodedResponse['fName'],
            lName: decodedResponse['lName'],
            email: decodedResponse['email'],
            phone: decodedResponse['phone']);
        await SessionManager().set('farmer', farmer);
        Farmer u = Farmer.fromJson(await SessionManager().get("farmer"));
        return true;
      } else {
         Vendor farmer = Vendor(
            exist: decodedResponse['exist'],
            token: decodedResponse['token'],
            role: decodedResponse['role'],
            vendor: decodedResponse['vendor'],
            fName: decodedResponse['fName'],
            lName: decodedResponse['lName'],
            email: decodedResponse['email'],
            phone: decodedResponse['phone']);
        await SessionManager().set('vendor', farmer);
        Vendor u = Vendor.fromJson(await SessionManager().get("vendor"));
        return true;
      }
    }
    // Token token = Token(token: recvdToken);

    // var sessionManager = SessionManager();
    // await sessionManager.set("token", token);
    // dynamic data = await SessionManager().get("token");
    // return recvdToken;
  }

  static void deleteSession() async {
    await SessionManager().destroy();
  }
}
