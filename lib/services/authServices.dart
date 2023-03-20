import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Session/Token.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/models/auth/MyUser.dart';
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
  }

  // static Future<String> getCurrentSession() async{
  //   // User u = User.fromJson(await SessionManager().get("user"));
  //   // return data;
  // }
}
