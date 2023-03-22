import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/auth/idController.dart';
import 'package:vegrow/controllers/auth/loginController.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final LoginController loginController = Get.find();
  final IdController idController = Get.find();
  FocusNode noteFocus = FocusNode();
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController pinController = TextEditingController();
  // late BuildContext context;
  @override
  Widget build(BuildContext context) {
    print("loginController.otpController.text");
    print(loginController.otpController.text);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstant.bgColorAuth,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(children: [
              SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50, shape: BoxShape.circle),
              child: SvgPicture.asset(
                  AppConstant.illustration3
              )
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
              "Enter OTP",
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
                  Pinput(
                    // defaultPinTheme: PinTheme(
                    //   textStyle: TextStyle(fontSize: 18)
                    // ),
                    controller: loginController.otpController,
                    androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                    // controller: pinController,
      
                    length: 6,
                    toolbarEnabled: false,
                    // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                    // inputFormatters: [Formatter()],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId:
                                      Get.parameters['verificationId'].toString(),
                                  smsCode: loginController.otpController.text);
      
                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          var result = await AuthServices.checkIfUserExists(
                              loginController.phoneController.text);
                          if (result == true) {
                            Get.offNamed('/dashboard');
                          } else {
                            Get.offNamed('/register/${loginController.phoneController.text}');
                          }
                        },
                           style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Verify",
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Didnt Revieve The Code? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black26)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Resend Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16 , color: Colors.green))
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }

  // Widget _textFieldOTP({bool ?first, last}) {
  //   // final BuildContext context;
  //   return Container(
  //     height: 85,
  //     child: AspectRatio(
  //       aspectRatio: .7,
  //       child: TextField(
  //         // focusNode: noteFocus,
  //         autofocus: true,
  //         onChanged: (value) {
  //           if (value.length == 1 && last == false) {
  //             FocusScope.of(context).nextFocus();
  //             // noteFocus.nextFocus();
  //           }
  //           if (value.length == 0 && first == false) {
  //             FocusScope.of(context).previousFocus();
  //             // noteFocus.previousFocus();
  //           }
  //         },
  //         showCursor: false,
  //         readOnly: false,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //         keyboardType: TextInputType.number,
  //         maxLength: 1,
  //         decoration: InputDecoration(
  //           // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //           counter: Offstage(),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(20),
  //             borderSide: BorderSide(width: 1, color: Colors.black12),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20),
  //               borderSide: BorderSide(width: 1, color: Colors.purple)),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
// import 'package:flutter/material.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xfff7f6fb),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Icon(
//                     Icons.arrow_back,
//                     size: 32,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.deepPurple.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Image.asset(
//                   'assets/images/illustration-3.png',
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Text(
//                 'Verification',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Enter your OTP code number",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black38,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 28,
//               ),
//               Container(
//                 padding: EdgeInsets.all(28),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _textFieldOTP(first: true, last: false),
//                         _textFieldOTP(first: false, last: false),
//                         _textFieldOTP(first: false, last: false),
//                         _textFieldOTP(first: false, last: true),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ButtonStyle(
//                           foregroundColor:
//                               MaterialStateProperty.all<Color>(Colors.white),
//                           backgroundColor:
//                               MaterialStateProperty.all<Color>(Colors.purple),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(14.0),
//                           child: Text(
//                             'Verify',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Text(
//                 "Didn't you receive any code?",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black38,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Text(
//                 "Resend New Code",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.purple,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _textFieldOTP({bool? first, last}) {
//     return Container(
//       height: 85,
//       child: AspectRatio(
//         aspectRatio: 1.0,
//         child: TextField(
//           autofocus: true,
//           onChanged: (value) {
//             if (value.length == 1 && last == false) {
//               FocusScope.of(context).nextFocus();
//             }
//             if (value.length == 0 && first == false) {
//               FocusScope.of(context).previousFocus();
//             }
//           },
//           showCursor: false,
//           readOnly: false,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           decoration: InputDecoration(
//             counter: Offstage(),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.black12),
//                 borderRadius: BorderRadius.circular(12)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.purple),
//                 borderRadius: BorderRadius.circular(12)),
//           ),
//         ),
//       ),
//     );
//   }
// }
