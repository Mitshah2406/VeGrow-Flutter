import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myList extends StatefulWidget {
  Function()? onPressed;
  myList({required this.onPressed, super.key});

  @override
  State<myList> createState() => _myListState(onPressed: onPressed);
}

class _myListState extends State<myList> {
  Function()? onPressed;
  _myListState({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Produc Name"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Hello 1"),
                  SizedBox(width: 5,),
                  Text("Hello 1"),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Hello 1"),
                  SizedBox(width: 5,),
                  Text("Hello 1"),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Hello 1"),
                  SizedBox(width: 5,),
                  Text("Hello 1"),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Hello 1"),
                  SizedBox(width: 5,),
                  Text("Hello 1"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
