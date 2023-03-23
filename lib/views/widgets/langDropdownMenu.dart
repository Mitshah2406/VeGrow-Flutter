import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';

class langDropdownMenu extends StatefulWidget {
  const langDropdownMenu({super.key});

  @override
  State<langDropdownMenu> createState() => _langDropdownMenuState();
}

class _langDropdownMenuState extends State<langDropdownMenu> {
  var list = <String>['English', 'Hindi', 'Marathi'];
  var languageCode = <String>['en', 'hi', 'mr'];
  var dropdownValue;
  _langDropdownMenuState() {
    dropdownValue = list.first;
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: Container(),
      iconSize: 24,
      icon: Icon(Icons.keyboard_arrow_right),
      borderRadius: BorderRadius.circular(3.0),
      onChanged: (String? value) async {
        print(list.indexOf(value!));
        print(AppConstant.prefs.getString("language"));
        AppConstant.prefs
            .setString("language", languageCode[list.indexOf(value)]);

        ;
        Get.updateLocale(
            Locale(AppConstant.prefs.getString("language")!, "IN"));
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
