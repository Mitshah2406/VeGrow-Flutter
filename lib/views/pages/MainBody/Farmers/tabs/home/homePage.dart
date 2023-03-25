import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/themes/themes.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/Orders/orderPage.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/ProducePage/singleProducePage.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/home/FarmerProduceTile.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/home/homeCard.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/home/listTile.dart';
import 'package:vegrow/views/widgets/myList.dart';
import 'package:vegrow/views/pages/Starter/popPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  final ThemeController theme = Get.find();

  // ScrollController
  // ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timestamp) {
  //     if (scrollController.hasClients) {
  //       double minScrollEvent = scrollController.position.minScrollExtent;
  //       double maxScrollEvent = scrollController.position.maxScrollExtent;
  //       animateToMaxMin(maxScrollEvent, minScrollEvent, maxScrollEvent, 10,
  //           scrollController);
  //     }
  //   });
  // }

  // animateToMaxMin(double max, double min, double direction, int seconds,
  //     ScrollController scrollController) {
  //   if (scrollController.hasClients) {
  //     scrollController
  //         .animateTo(direction,
  //             duration: Duration(seconds: seconds), curve: Curves.linear)
  //         .then((value) {
  //       direction = direction == max ? min : max;
  //       animateToMaxMin(max, min, direction, seconds, scrollController);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
            ),
          ),
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   brightness: Brightness.light,
          //   elevation: 0,
          //   centerTitle: true,
          //   leadingWidth: 500,
          //   // leading: ,
          // ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.location_on_outlined, size: 24),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  homeController.farmerList[0]
                                          .containsKey('location')
                                      ? homeController.farmerList[0]['location']
                                              ['sublocality']
                                          .toString()
                                      : "Add location",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Bono Nova'))
                              // Text(
                              //     homeController.farmerList[0]
                              //             .containsKey('location')
                              //         ? homeController.farmerList[0]['location']
                              //                 ['pinCode']
                              //             .toString()
                              //         : "000000",
                              //     style: const TextStyle(fontSize: 16))
                            ],
                          ),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          // IconButton(
                          //     onPressed: () {
                          //       Get.toNamed('/location');
                          //     },
                          //     icon: const Icon(Icons.expand_more)),
                        ],
                      )
                    ],
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColor,
                //       borderRadius:
                //           BorderRadius.vertical(bottom: Radius.circular(40))),
                //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Good , ",
                //         style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w400
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Text(
                //         "${homeController.farmerList[0]['fName'].toString().split(" ")[0].capitalizeFirst}",
                //         style: const TextStyle(fontSize: 20),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       // const Text(
                //       //   "Write the description",
                //       //   style: TextStyle(
                //       //       color: Colors.white,
                //       //       fontSize: 20,
                //       //       fontWeight: FontWeight.w600),
                //       // ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       // Container(
                //       //   padding: const EdgeInsets.all(5),
                //       //   decoration: BoxDecoration(
                //       //       color: Color.fromRGBO(244, 243, 243, 1),
                //       //       borderRadius: BorderRadius.circular(15)),
                //       //   child: const TextField(
                //       //     decoration: InputDecoration(
                //       //         border: InputBorder.none,
                //       //         prefixIcon: Icon(
                //       //           Icons.search,
                //       //           color: Colors.black87,
                //       //         ),
                //       //         hintText: "Search for the produce",
                //       //         hintStyle:
                //       //             TextStyle(color: Colors.grey, fontSize: 15)),
                //       //   ),
                //       // ),
                //       // const SizedBox(
                //       //   height: 10,
                //       // ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: HomeCard(),
                ),

                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text('Subscription',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          fontFamily: 'Bono Nova')),
                ),
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        width: 370,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                            )
                          ],
                          // border: Border.all(  width: 2.0),
                          color: Color(0xffE4D0D0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Platinum",
                                style: TextStyle(
                                  fontFamily: "Bono Nova",
                                  fontSize: 27,
                                  letterSpacing: 1,
                                  color: Color(0xFFDF7857),
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Benefits',
                                  style: TextStyle(
                                      color: Color(0xFFA86464),
                                      fontFamily: 'Bono Nova',
                                      letterSpacing: 1, 
                                      fontSize: 22
                                    )),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Premium Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ]
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        width: 370,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 231, 184, 30),  width: 2.0),
                          color: Color.fromARGB(255, 248, 196, 26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Gold",
                                style: TextStyle(
                                  fontFamily: "Bono Nova",
                                  fontSize: 27,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Benefits',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Bono Nova',
                                      letterSpacing: 1, 
                                      fontSize: 22
                                    )),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ]
                          ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        width: 370,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2
                            )
                          ],
                          // border: Border.all(color: Colors.,  width: 2.0),
                          color: Color(0xFFDDDDDD),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Silver",
                                style: TextStyle(
                                  fontFamily: "Bono Nova",
                                  fontSize: 27,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Benefits',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Bono Nova',
                                      letterSpacing: 1, 
                                      fontSize: 22
                                    )),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color(0xFFE3FFF8),
                                        child: Icon(Icons.done, size: 16,),
                                      ),
                                      // SizedBox(width: 10),
                                      Text(
                                        "Buy Our Gold Services",
                                        style: TextStyle(
                                          fontFamily: 'Bono Nova',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),
                                      ),
                                      // SizedBox(width: 30),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Color.fromARGB(255, 239, 245, 243),
                                        child: Icon(Icons.monetization_on_outlined, size: 16,),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ]
                          ),
                      ),
                    ),
                    
                  ],
                )),
                // Text("Hello")
              ],
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
