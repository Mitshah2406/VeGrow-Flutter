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
import 'package:vegrow/views/pages/MainBody/tabs/Orders/orderPage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/ProducePage/singleProducePage.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/FarmerProduceTile.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/listTile.dart';
import 'package:vegrow/views/widgets/myCard.dart';
import 'package:vegrow/views/widgets/myList.dart';

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
    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
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
                              homeController.farmerList[0]
                                      .containsKey('location')
                                  ? homeController.farmerList[0]['location']
                                          ['sublocality']
                                      .toString()
                                  : "Add location",
                              style: const TextStyle(fontSize: 16)),
                          Text(
                              homeController.farmerList[0]
                                      .containsKey('location')
                                  ? homeController.farmerList[0]['location']
                                          ['pinCode']
                                      .toString()
                                  : "000000",
                              style: const TextStyle(fontSize: 16))
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good ${greetFarmer()}, ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            // fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${homeController.farmerList[0]['fName'].toString().capitalize}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Write the description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //       color: Color.fromRGBO(244, 243, 243, 1),
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: const TextField(
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         prefixIcon: Icon(
                      //           Icons.search,
                      //           color: Colors.black87,
                      //         ),
                      //         hintText: "Search for the produce",
                      //         hintStyle:
                      //             TextStyle(color: Colors.grey, fontSize: 15)),
                      //   ),
                      // ),
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
                  child: Text('Some Data to be loaded',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //   child: Container(
                //     height: 140,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 5,
                //         itemBuilder: (context, index) {
                //           return const FarmerProduceTile(
                //               imagePath: "assets/images/farmer.png",
                //               produceTitle: "Farmer One",
                //               produceDescription: "This is Awesome");
                //         }),
                //   ),
                // ),
                Container(
                    height: 200,
                    // child: CustomScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   controller: scrollController,
                    //   slivers: [
                    //     Text("Hello")
                    //   ],
                    // )
                    child: PageView.builder(
                        // controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return myCard();
                        })),

                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text('Your Pending Produce Bids',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                ),

               
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: myList(
                                  onPressed: (){
                                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                                      return SingleProducePage();
                                    }));  
                                  },
                                ),
                        );
                      }
                    )
                  ),
                )
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
