import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class myDateTextField extends StatefulWidget {
  final controller;

  myDateTextField({
    required this.controller,
    super.key
  });

  @override
  State<myDateTextField> createState() => _myDateTextFieldState();
}

class _myDateTextFieldState extends State<myDateTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: widget.controller.text,
      // initialValue: widget.controller.text,
      validator: (value){
        if(value == ""){
          return "Enter Expiry Date";
        }
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(context: context, 
        initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

        if(pickedDate != null){
          if(pickedDate.isAfter(DateTime.now())){
            setState(() {
              widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
            });
          }
        }
      },
      controller: widget.controller,
      decoration: InputDecoration(
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
        labelText: "Enter your Expiry Date",
        labelStyle: const TextStyle(fontSize: 20),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: "Expiry Date",
        hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
    );
  }
}
