import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/auth/idController.dart';
import 'package:vegrow/controllers/auth/loginController.dart';
import 'package:vegrow/controllers/auth/registerController.dart';
import 'package:vegrow/controllers/locationController.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/appConstant.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // var tag = 1;
  List<String> tags = [];
  final RegisterController registerController = Get.put(RegisterController());
  final LocationController locationController = Get.put(LocationController());
  // final LoginController loginController = Get.put(LoginController());
  final IdController idController = Get.find();
  // final LoginController loginController = Get.find();

  List<String> options = ["Farmer", "Vendor"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstant.bgColorAuth,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(children: [
            // Align(
        
            //     alignment: Alignment.topLeft,
            //     child: GestureDetector(
            //       onTap: () {
            //         Get.back();
            //       },
            //       child: Icon(
            //         Icons.arrow_back,
            //         color: Colors.black54,
            //         size: 32,
            //       ),
            //     )),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                child: SvgPicture.asset(AppConstant.register, fit: BoxFit.cover,width: 100, height: 50,)),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Registration Form",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter Your Basic Details..",
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
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Text(
                        "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFormField(
                      controller: registerController.nameController,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(18)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(18)),
                          hintText: "Enter Your Name",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Text(
                        "Email: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFormField(
                      controller: registerController.emailController,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(18)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(18)),
                          hintText: "Enter Your Email",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                      child: Text(
                        "Are You A ? ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Obx(() => ChipsChoice.single(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          value: registerController.tag.toInt(),
                          onChanged: ((val) {
                            setState(() {
                              registerController.tag =
                                  RxInt(int.parse(val.toString()));
                            });
                          }),
                          choiceItems: C2Choice.listFrom(
                              source: options,
                              value: (i, v) => i,
                              label: (i, v) => v.toString()),
                          choiceActiveStyle: C2ChoiceStyle(
                              color: Colors.green,
                              borderColor: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          choiceStyle: C2ChoiceStyle(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        )),
                        SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            bool result = await AuthServices.registerUser(
                                idController.inputData(),
                                registerController.nameController.text,
                                registerController.emailController.text,
                                Get.parameters['number'],
                                int.parse(registerController.tag.toString()));
              
                            if (result) {
                              Get.offNamed("/dashboard");
                            } else {
                              //toast
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Next",
                              style: TextStyle(fontSize: 16),
                            ),
                          )),
                    )
                  ],
                ),
                // Obx(() => ChipsChoice.single(
                //       padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                //       value: registerController.tag.toInt(),
                //       onChanged: ((val) {
                //         setState(() {
                //           registerController.tag =
                //               RxInt(int.parse(val.toString()));
                //         });
                //       }),
                //       choiceItems: C2Choice.listFrom(
                //           source: options,
                //           value: (i, v) => i,
                //           label: (i, v) => v.toString()),
                //       choiceActiveStyle: C2ChoiceStyle(
                //           color: Color.fromARGB(255, 155, 184, 209),
                //           borderColor: Colors.blue,
                //           borderRadius: BorderRadius.circular(5)),
                //       choiceStyle: C2ChoiceStyle(
                //           color: Colors.blue,
                //           borderRadius: BorderRadius.all(Radius.circular(5))),
                //     )),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       onPressed: () async {
                //         bool result = await AuthServices.registerUser(
                //             idController.inputData(),
                //             registerController.nameController.text,
                //             registerController.emailController.text,
                //             Get.parameters['number'],
                //             int.parse(registerController.tag.toString()));

                //         if (result) {
                //           Get.offNamed("/dashboard");
                              
                //         } else {
                //           //toast
                //         }
                //       },
                //       style: ButtonStyle(
                //           foregroundColor:
                //               MaterialStateProperty.all<Color>(Colors.white),
                //           backgroundColor: // setVisible?
                //               MaterialStateProperty.all<Color>(Colors
                //                   .purple), //: MaterialStateProperty.all<Color?>(Colors.purple[200]),
                //           shape:
                //               MaterialStateProperty.all<RoundedRectangleBorder>(
                //                   RoundedRectangleBorder(
                //                       borderRadius:
                //                           BorderRadius.circular(24)))),
                //       child: Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Text(
                //           "Next",
                //           style: TextStyle(fontSize: 16),
                //         ),
                //       )),
                // )
              ),
            ),
          ]),
        ),
      )));
  }
}
