import 'package:flutter/material.dart';

class AddProductTxtField extends StatelessWidget {
  clickEvent(){}
  AddProductTxtField({
    Key? key,
    required this.fieldName,
    required this.type,
    this.padding = const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
     this.action= TextInputAction.unspecified,
     this.min=1,
     this.max=1,
     this.disable=false,
    required this.myController,
    required this.myIcon,
  
    this.prefixIconColor = Colors.blueAccent,
  });
  final TextEditingController myController;
  String fieldName;
  EdgeInsets padding;
  final IconData myIcon;
  Color prefixIconColor;
  TextInputType type;
  TextInputAction action;
  int min;
  int max;
  bool disable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: action,
      minLines: min,
      maxLines: max,
      keyboardType: type,
      controller: myController,
      readOnly: disable,
      style: TextStyle(fontSize: 20, color: Colors.green.shade300),
      decoration: InputDecoration(
        contentPadding: padding,
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.green, fontSize: 18),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),), 
    
        errorStyle: const TextStyle(color: Colors.red, fontSize: 14)
        ),
         validator: (value){

          if(value==""){
           return "Enter Proper Details..";
           
          }
          
         },
    );
  }
}
