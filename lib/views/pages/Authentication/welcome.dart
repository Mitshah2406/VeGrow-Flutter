import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/widgets/myButton.dart';
import 'package:vegrow/views/widgets/myTextField.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstant.bgColorAuth,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: Column(children: [
          Image.asset(
            'assets/images/illustration-1.png',
            width: 250,
          ),
          SizedBox(
            height: 20.0,
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
                Get.toNamed('/login');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Get Started",
                style: TextStyle(fontSize: 16),),
              )),
          )
        ]),
      )),
    );
  }
}
