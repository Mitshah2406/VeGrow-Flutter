import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/locationController.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  late double currentPositionlat;
  late double currentPositionlong;
  late double lastPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        // centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Select Location",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                iconSize: 40,
                icon: const Icon(Icons.close, color: Colors.white))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                style: TextStyle(
                  fontSize: 22
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.0, end: 15.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black87,
                      ),
                    ),
                    hintText: "Enter your location",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.near_me,color: Colors.purple, size: 25,),
                const SizedBox(width: 20,),
                TextButton(
                  onPressed: () async {
                      bool serviceEnabled;
                      LocationPermission permission;

                      serviceEnabled = await Geolocator.isLocationServiceEnabled();

                      if(!serviceEnabled){
                        showDialog(
                          context: context,
                          builder: (context){
                            return const AlertDialog(
                              title: Text("Location!!!"),
                              content: Text("Location"),
                            );
                          }
                        );
                      }

                      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                      if(position.latitude == null && position.longitude == null){
                        var lastKnowPostion = await Geolocator.getLastKnownPosition();
                        setState(() {
                          lastPosition = lastKnowPostion!.latitude; lastKnowPostion.longitude; 
                        });
                      }else{
                        setState(() {
                          currentPositionlat =  position.latitude; 
                          currentPositionlong = position.longitude;
                        });
                      }

                      print(currentPositionlat);
                      print(currentPositionlong);

                      if(currentPositionlat != null && currentPositionlat != null){
                        showDialog(
                          context: context,
                          builder: (context){
                            return const AlertDialog(
                              backgroundColor: Colors.green,
                              title: Text("Location!!!", style: TextStyle(color: Colors.white),),
                              content: Text("Location Fetched Successfully", style: TextStyle(color: Colors.white),),
                            );
                          }
                        );
                      }else{
                        showDialog(
                          context: context,
                          builder: (context){
                            return const AlertDialog(
                              title: Text("Location!!!"),
                              content: Text("Unable to find location"),
                            );
                          }
                        );
                      }

                  },
                  child: const Text(
                    "Use current location", 
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 18
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(thickness: 1,),
          )
        ],
      )
    );
  }
}
