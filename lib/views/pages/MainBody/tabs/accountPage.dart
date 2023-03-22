import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/auth/loginController.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/services/authServices.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(
                onPressed: () async {
                //  var u =
                    //  await SessionManager().get("farmer");
                  // print(u);
                 AuthServices.deleteSession();
            FirebaseAuth.instance.currentUser?.delete();
                  await FirebaseAuth.instance.signOut();
                    Get.offNamed('/logout');
                  
                },
                child: Text("Logout")),
      ),
    );
  }
}
