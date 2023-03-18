
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/views/pages/Authentication/register.dart';
import 'package:vegrow/views/widgets/myButton.dart';
import 'package:vegrow/views/widgets/myTextField.dart';

class login extends StatefulWidget {
  login({super.key});

  // Controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  void login(){}

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
              const Icon(Icons.lock, size: 150),
              
              const SizedBox(height: 50),
              
              // Text
              Text(
                "Welcome back you've been missed!",
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
                  
              // Password TextField
              myTextField(
                controller: widget.passwordController,
                hintText: "Password",
                obscureText: true,
              ),
                  
              // Forgot Password
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?", style: TextStyle(
                      color: AppConstant.textColor,
                      fontSize: 16
                    ),),
                  ],
                ),
              ),
                  
              const SizedBox(height: 50),
                  
              // Log In Button
              MyButton(onTap: login, text: "Sign In",),

              const SizedBox(height: 80),


              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member? ", style: TextStyle(
                    color: AppConstant.textColor,
                    fontSize: 18
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
                        return register();
                      }));
                    },
                    child: Text("Register Now", style: TextStyle(
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