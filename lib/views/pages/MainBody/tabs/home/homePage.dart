import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/themes/themes.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/FarmerProduceTile.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/listTile.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ProductController products = Get.put(ProductController());
  final HomeController homeController = Get.put(HomeController());
  final ThemeController theme = Get.find();
  // var farmerData = "";


  String greetFarmer() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return "Morning";
    } else if (hour <= 17) {
      return "Afternoon";
    } else if (hour > 17 && hour < 19) {
      return "Evening";
    }
    return "Night";
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(homeController.isLoading.value){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return popPage(
          page: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
              brightness: Brightness.light,
              elevation: 0,
              leadingWidth: 200,
              leading: Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.location_on_outlined, size: 35),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              homeController.farmerList[0]['location'] != {} ? 
                              homeController.farmerList[0]['location']['sublocality'].toString() : "PinCode",
                              style: const TextStyle(fontSize: 16)
                            ),
                            Text(
                              homeController.farmerList[0]['location'] != {} ? 
                              homeController.farmerList[0]['location']['pinCode'].toString() : "000000",
                              style: const TextStyle(fontSize: 16)
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/location');
                            },
                            icon: const Icon(Icons.expand_more)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor, 
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good " + greetFarmer() + ",",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          homeController.farmerList[0]['fName'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(244, 243, 243, 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                                hintText: "Search for the produce",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text('Text',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      height: 140,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const FarmerProduceTile(
                                imagePath: "assets/images/farmer.png",
                                produceTitle: "Farmer One",
                                produceDescription: "This is Awesome");
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text('Recently Added',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      height: 140,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const listTile();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ),
        );
      }
    });
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}
