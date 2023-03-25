import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/auth/idController.dart';
import 'package:vegrow/controllers/auth/loginController.dart';
import 'package:vegrow/controllers/auth/registerController.dart';
import 'package:vegrow/controllers/locationController.dart';
import 'package:vegrow/services/authServices.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

import '../../../consts/appConstant.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> tags = [];

  final RegisterController registerController = Get.put(RegisterController());
  final LocationController locationController = Get.put(LocationController());
  final IdController idController = Get.find();

  final _formKey = GlobalKey<FormState>();

  List<String> options = ["Farmer", "Vendor"];
  @override
  Widget build(BuildContext context) {
    return popPage(
        page: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppConstant.bgColorAuth,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          AppConstant.register,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 50,
                        )),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Form(
                        key: _formKey,
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == "") {
                                  return "Enter Your Name";
                                }
                              },
                              controller: registerController.nameController,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(18)),
                                  hintText: "Enter Your Name",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                              child: Text(
                                "Email: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == "") {
                                  return "Enter Your Email Address";
                                } else if (value!.contains('@')) {
                                  return null;
                                } else {
                                  return "Enter valid Email Address";
                                }
                              },
                              controller: registerController.emailController,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(18)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(18)),
                                  hintText: "Enter Your Email",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                              child: Text(
                                "Are You A ? ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Obx(() => ChipsChoice.single(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      int result =
                                          await AuthServices.registerUser(
                                              idController.inputData(),
                                              registerController
                                                  .nameController.text,
                                              registerController
                                                  .emailController.text,
                                              Get.parameters['number'],
                                              int.parse(registerController.tag
                                                  .toString()));
            
                                      print("Resultttt");
                                      print(result);
            
                                      if (result == 1) {
                                        Get.offNamed("/farmerDashboard");
                                      }else if(result == 2){
                                        Get.offNamed("/vendorDashboard");
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Technical Error",
                                            fontSize: 18,
                                            textColor: Colors.white,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.red);
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                      ),
                    ),
                  ]),
                ),
              )),
            )));
  }
  // )
}
