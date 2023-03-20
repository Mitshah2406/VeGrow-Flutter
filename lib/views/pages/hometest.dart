import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/auth/loginController.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/services/authServices.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        
  }
  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Welcome "),
          ),
          SizedBox(
            height: 100.0,
          ),
          ElevatedButton(
              onPressed: () async {
              //  var u =
                  //  await SessionManager().get("farmer");
                // print(u);
               AuthServices.deleteSession();
          FirebaseAuth.instance.currentUser?.delete();
                await FirebaseAuth.instance.signOut();
                  Get.offNamed('/logout');
                
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
