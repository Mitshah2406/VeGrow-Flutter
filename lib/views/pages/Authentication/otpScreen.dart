import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstant.bgColorAuth,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                  size: 32,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade50, shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/illustration-3.png',
              width: 250,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Enter the OTP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Enter Your Phone Number and We'll Send You a Verification Code",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 38,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                _textFieldOTP( true, false),
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //   decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.black12),
                //           borderRadius: BorderRadius.circular(18)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.black12),
                //           borderRadius: BorderRadius.circular(18)),
                //       prefix: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //         child: Text(
                //           "+91",
                //           style: TextStyle(
                //               fontSize: 18, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       suffixIcon: Icon(
                //         Icons.check_circle,
                //         color: Colors.green,
                //         size: 32,
                //       )),
                // ),
                SizedBox(
                  height: 22,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/sendOtp');
                },
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          )
        ]),
      )),
    );
  }
    _textFieldOTP([ bool ?first, last]){
      return Container(
        height: 85,
        child: AspectRatio(aspectRatio: 
        1.9,
        child: TextField(
          autofocus: true,
          onChanged: (value){},
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            // enabledBorder: OutlineInputBorder(borderRadius: )

          ),
        ),),
      );
    }
}