import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/locationController.dart';
// import 'package:vegrow/models/Session/Token.dart';
// import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/models/auth/MyUser.dart';
// import 'package:vegrow/models/auth/Vendor.dart';
// import 'package:vegrow/services/locationServices.dart';

class AuthServices {
  static Future<int> registerUser(id, name, email, number, role) async {
    try{
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

      var recvdToken = jsonDecode(response.body)['exist'];
      var decodedResponse = jsonDecode(response.body);
      if (recvdToken == false) {
        return 0;
      } else {
        MyUser farmer = MyUser(
            token: decodedResponse['token'],
            role: decodedResponse['role'],
            id: decodedResponse['id'],
            fName: decodedResponse['fName'],
            lName: decodedResponse['lName'],
            email: decodedResponse['email'],
            phone: decodedResponse['phone']
          );
        await SessionManager().set('user', farmer);
        MyUser u = MyUser.fromJson(await SessionManager().get("user"));
        dynamic data = await SessionManager().get("user");
        // print(data['token']);
        var result = await LocationController.promptLocation();
        print(result);
        var role = data['role'];
        print(role);

        if(role == "vendor"){
          return 2;
        }else{
          return 1;
        }
      }
    } catch (e) {
      return 0;
    }
  }

  static Future<int> checkIfUserExists(phone) async {
    print(phone);
    var response = await http.post(
        Uri.parse(
          "${AppConstant.IP}/authentication/phoneNumberCheck/",
        ),
        body: jsonEncode({"phone": phone}));

    var recvdToken = jsonDecode(response.body)['exist'];
    var decodedResponse = jsonDecode(response.body);
    if (recvdToken == false) {
      return 0;
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
       dynamic data = await SessionManager().get("user");
        // print(data['token']);
        var result = await LocationController.promptLocation();
        print(result);
        var role = data['role'];

        if(role == "vendor"){
          return 2;
        }else{
          return 1;
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
    await SessionManager().remove("user");
     dynamic data = await SessionManager().get("user");
    print("Session Dleted");
    print(data);
    var prefs = await SharedPreferences.getInstance();
    Get.offNamed('/logout');
    print(prefs.getBool('show'));
    // prefs.setBool('show', true);
  }

  static Future<bool> getSession() async {
    bool session = await SessionManager().containsKey("user");

    if (session) {
      return true;
    } else {
      return false;
    }
  }

  static Future<dynamic> getCurrentSession() async {
    dynamic data = await SessionManager().get("user");
    // print(data['token']);
    print(data);
    return data;
  }

  //  static Future<String> getSessionData() async {
  //   bool session = await SessionManager().get('user');
  //   // bool token = await SessionManager().containsKey("token");

  //   return session.toString();
  // }
}
