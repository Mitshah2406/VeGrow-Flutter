import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select Delivery location", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
              IconButton(
                onPressed: (){
                  Get.back();
                },
                iconSize: 50,
                icon: const Icon(Icons.close, color: Colors.black)
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Column(
          children: [
            // TextFormField(
            //   decoration: InputDecoration(
            //     le
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(
            //         color: Colors.grey.shade200,
            //       ),
            //     ),
            //     filled: true,
            //     fillColor: Colors.grey.shade200
            //   ),
            // )
            Container(
              padding: const EdgeInsets.all(12.0),
              // decoration: BoxDecoration(
              //   color: Colors.grey.shade200
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  const Icon(Icons.location_on)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}