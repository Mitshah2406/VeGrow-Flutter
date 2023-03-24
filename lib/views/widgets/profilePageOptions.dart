import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/services/authServices.dart';

import 'langDropdownMenu.dart';

class optionsCard extends StatefulWidget {
  const optionsCard({super.key});

  @override
  State<optionsCard> createState() => _optionsCardState();
}

class _optionsCardState extends State<optionsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 500, 20, 0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Outstanding Transactions".tr,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "My Reviews".tr,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "My Reviews".tr,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () async {
                var d = await AppConstant.translate(string: "mit dada");
                print(d);
              },
            ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
              leading: Icon(
                CupertinoIcons.globe,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "Languages".tr,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              subtitle: Text("English"),
              trailing: langDropdownMenu()

              // trailing: IconButton(
              //   icon: Icon(Icons.keyboard_arrow_right),
              //   onPressed: () async{ var data=await AppConstant.translate(string: "Sai");
              //   print(data);},
              // ),
              ),
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            onTap: () {
              AuthServices.deleteSession();
              Get.offNamed('/logout');
            },
            leading: Icon(
              Icons.monetization_on,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Logout".tr,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w600),
            ),
            // subtitle: Text("Logout"),
            // trailing: langDropdownMenu()
            // trailing: IconButton(
            //   icon: const Icon(Icons.keyboard_arrow_right),
            //   onPressed: () {
            //     AuthServices.deleteSession();
            //     Get.toNamed('/logout');
            //   },
            // ),
          ),
        ]),
      ),
    );
  }
}
