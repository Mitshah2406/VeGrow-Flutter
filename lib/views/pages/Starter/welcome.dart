import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegrow/consts/appConstant.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppConstant.bgColorAuth,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         ClipOval(
    child: Image.asset(
        AppConstant.illustration1,
        fit: BoxFit.cover,
        width: 250,
    ),
),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Let's Get Started..",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Never a better time than no to start!",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black38),
          ),
          SizedBox(
            height: 38,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Get.offNamed('/login');
              },
            style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              
              child: Padding(

                padding: const EdgeInsets.all(16.0),
                child: Text("Get Started",
                style: TextStyle(fontSize: 16),),
              )),
          ),
          // GestureDetector(
          //   onTap: () async {
          //     var pref = await SharedPreferences.getInstance();
          //     pref.setBool('show', false);
          //     print('Done');
          //   },
          //   child: const Text("Revert", style: TextStyle(fontSize: 20),),
          // ),
        ]),
      )),
    );
  }
}
