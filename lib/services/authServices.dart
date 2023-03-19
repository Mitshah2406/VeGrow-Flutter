import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Session/Token.dart';

class AuthServices {

  static Future<bool> registerUser(id, name, email, number, role) async {

  try{  String url = role == 0
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
return true;

}catch(e){
  return false;
}
  }


static Future<bool> checkIfUserExists(phone)async{
   var response = await http.post(
        Uri.parse(
          "${AppConstant.Ip}/authentication/phoneNumberCheck/",
        ),
        body: jsonEncode({
          "phone":phone
        }));

         var recvdToken = jsonDecode(response.body)['exist'];

         if(recvdToken)
         {
          var response = await http.post(
          Uri.parse(
            "${AppConstant.Ip}/authentication/farmerLogin/",
          ),
          body: jsonEncode({"phone": phone}));
         }
    // Token token = Token(token: recvdToken);

    // var sessionManager = SessionManager();
    // await sessionManager.set("token", token);
    // dynamic data = await SessionManager().get("token");
    return recvdToken;
}
}
