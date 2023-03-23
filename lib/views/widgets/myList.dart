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
        border: Border.all(
          color: Colors.green,
          width: 1.5
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 110,
                    height: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400                        ),
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset("assets/images/illustration-1.png"),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Data",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Text("Data",
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade600))
                    ],
                  ),
                ],
              ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.arrow_forward_ios)
                  )
            ],
          )
        ],
      ),
    );
  }
}
