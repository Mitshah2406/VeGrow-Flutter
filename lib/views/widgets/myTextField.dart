import 'dart:ui';

import 'package:flutter/material.dart';

class myTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final controller;
  final bool obscureText;
  TextInputType isNumber;

  myTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.isNumber,
    super.key
  });

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value == ""){
          return "Enter Value";
        }
      },
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.isNumber,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder:
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5)
            ),
        focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5)
            ),
        focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400),
              borderRadius: BorderRadius.circular(5)
            ),
        errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400),
              borderRadius: BorderRadius.circular(5)
            ),
        label: Text(widget.labelText),
        labelStyle: const TextStyle(fontSize: 20),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
    );
  }
}
