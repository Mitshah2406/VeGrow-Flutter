import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/locationController.dart';
import 'package:vegrow/models/Session/Token.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/models/auth/MyUser.dart';
import 'package:vegrow/models/auth/Vendor.dart';

class AuthServices {
  static Future<bool> registerUser(id, name, email, number, role) async {
    try {
      String url = role == 0
          ? "${AppConstant.IP}/authentication/farmerSignUp/"
          : "${AppConstant.IP}/authentication/vendorSignUp/";

      var response = await http.post(
          Uri.parse(
            url,
          ),
          body: jsonEncode({
            "id": id,
            "fName": name,
            "lName": name,
            "phone": "+91" + number,
            "email": email,
          }));
      var temp = jsonEncode({
        "id": id,
        "fName": name,
        "lName": name,
        "phone": '+91' + number,
        "email": email,
      });
      print(temp);
      var recvdToken = jsonDecode(response.body)['token'];
      var recvdId = jsonDecode(response.body)['id'];
      Token token = Token(token: recvdToken);

      var sessionManager = SessionManager();
      await sessionManager.set("token", token);
      await sessionManager.set('farmerId', id);
      dynamic data = await SessionManager().get("token");
      dynamic data1 = await SessionManager().get("farmerId");
      print(data);
      print(data1);

      var res = await LocationController.promptLocation();
      print("Data comess sexy");
      print(res);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkIfUserExists(phone) async {
    print(phone);
    var response = await http.post(
        Uri.parse(
          "${AppConstant.IP}/authentication/phoneNumberCheck/",
        ),
        body: jsonEncode({"phone": phone}));

    var recvdToken = jsonDecode(response.body)['exist'];
    var decodedResponse = jsonDecode(response.body);
    if (recvdToken == false) {
      return false;
    } else {
      MyUser farmer = MyUser(
          exist: decodedResponse['exist'],
          token: decodedResponse['token'],
          role: decodedResponse['role'],
          id: decodedResponse['id'],
          fName: decodedResponse['fName'],
          lName: decodedResponse['lName'],
          email: decodedResponse['email'],
          phone: decodedResponse['phone']);
      await SessionManager().set('user', farmer);
      MyUser u = MyUser.fromJson(await SessionManager().get("user"));
      return true;
    }
    // Token token = Token(token: recvdToken);

    // var sessionManager = SessionManager();
    // await sessionManager.set("token", token);
    // dynamic data = await SessionManager().get("token");
    // return recvdToken;
  }

  static void deleteSession() async {
    await SessionManager().destroy();
    var prefs = await SharedPreferences.getInstance();
    print(prefs.getBool('show'));
    prefs.setBool('show', true);
  }

  static Future<bool> getSession() async {
    bool session = await SessionManager().containsKey("user");
    bool token = await SessionManager().containsKey("token");

    if (session || token) {
      return true;
    } else {
      return false;
    }
  }

   static Future<String> getSessionData() async {
    bool session = await SessionManager().get('user');
    // bool token = await SessionManager().containsKey("token");

    return session.toString();
  }
}
