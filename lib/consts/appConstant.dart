import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class AppConstant {
  static final translator = GoogleTranslator();
  static final String IP = "http://192.168.0.106:9090";

  // Sizes
  static const double PADDING_SIZE = 16.0;
  // Colors that we use in our app
static final kPrimaryColor = Color(0xFF0C9869);
static final kTextColor = Color(0xFF3C4046);
static final kBackgroundColor = Color(0xFFF9F8FD);
static final double kDefaultPadding = 20.0;

  // Colors
  static final bgColor = Colors.grey[300];
  static final textColor = Colors.grey[700];
  static final bgColorAuth = Color(0xfff7f6fb);

  // Images
  static const String introPageImg = "assets/images/page1.png";
  static const String illustration1 = "assets/images/welcome.png";
  static const String illustration2 = "assets/images/login.png";
  static const String illustration3 = "assets/images/otp.svg";
  static const String register = "assets/images/register.svg";
  static const String addProduct = "assets/images/farmer.png";
  static late SharedPreferences prefs;
  static Future<String> translate({required string}) async {
    var trans = await translator.translate(string,
        from: 'en', to: prefs.getString("language")!);
    print("okay");
    print(trans);
    return trans.toString();
  }
}
