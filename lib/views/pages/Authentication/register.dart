
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/pages/Authentication/login.dart';
import 'package:vegrow/views/widgets/myButton.dart';
import 'package:vegrow/views/widgets/myTextField.dart';

class register extends StatefulWidget {
  register({super.key});

  // Controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  void register(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      body: Form(
        // key: ,         // Pending
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // Icon
              const Icon(Icons.lock_open, size: 150),
              
              const SizedBox(height: 50),
              
              // Text
              Text(
                "Our App is waiting for you",
                style: TextStyle(
                  color: AppConstant.textColor,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 50),
              
              // Username TextField
              myTextField(
                controller: widget.usernameController,
                hintText: "Username",
                obscureText: false,
              ),
                  
              const SizedBox(height: 40),

              // Email TextField
              myTextField(
                controller: widget.emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 40),
                  
              // Password TextField
              myTextField(
                controller: widget.passwordController,
                hintText: "Password",
                obscureText: true,
              ),
                  
              const SizedBox(height: 50),
                  
              // Log In Button
              MyButton(onTap: register, text: "Sign Up",),

              const SizedBox(height: 80),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Wanna Log In? ", style: TextStyle(
                    color: AppConstant.textColor,
                    fontSize: 18
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
                        return login();
                      }));
                    },
                    child: Text("Login Now", style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}