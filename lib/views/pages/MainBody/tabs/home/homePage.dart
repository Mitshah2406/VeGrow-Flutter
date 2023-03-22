import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/themes/themes.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/FarmerProduceTile.dart';
import 'package:vegrow/views/pages/MainBody/tabs/home/listTile.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ProductController products = Get.put(ProductController());
  // final HomeController homeController = Get.put(HomeController());
  final ThemeController theme = Get.find();
  // var farmerData = "";


  String greetFarmer(){
    final hour = TimeOfDay.now().hour;

    if(hour <= 12){
      return "Morning";
    }else if(hour <= 17){
      return "Afternoon";
    }else if(hour > 17 && hour < 19){
      return "Evening";
    }
    return "Night";
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        brightness: Brightness.light,
        elevation: 0,
        leadingWidth: 200,
        leading: Container( 
          child: Row(
             children: [
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.location_on_outlined, size: 35),
                  const SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Pincode", style: TextStyle(
                        fontSize: 16
                      )),
                      Text("000000", style: TextStyle(
                        fontSize: 16
                      ))
                    ],
                  ),
                  const SizedBox(width: 5,),
                  IconButton(
                    onPressed: (){
                      Get.toNamed('/location');
                    }, 
                    icon: const Icon(Icons.expand_more)
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
        //   // Text("Add Product"),
          IconButton(
            onPressed: (){
              Get.toNamed('/addProduct');
            },
            iconSize: 30,
            icon: const Icon(Icons.add)
          ),
          
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good " + greetFarmer() + ",",
                      style: const TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hello",
                      // homeController.farmerList[0]['fName'],
                      // AppConstant.farmerData['fName'],
                      // farmerData['fName'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
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
                child: Text(
                  'Text',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  )
                ),
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
                    itemBuilder: (context, index){
                      return const FarmerProduceTile(imagePath: "assets/images/farmer.png", produceTitle: "Farmer One", produceDescription: "This is Awesome");
                    }
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Recently Added',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return const listTile();
                    }
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Rate',
              //         style:
              //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(
              //         height: 15,
              //       ),
              //       Container(
              //         height: 200,
              //         child: ListView(
              //           scrollDirection: Axis.horizontal,
              //           children: [
              //             promoCard('assets/images/one.jpg'),
              //             promoCard('assets/images/two.jpg'),
              //             promoCard('assets/images/three.jpg'),
              //             promoCard('assets/images/four.jpg'),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Container(
              //         height: 150,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           image: DecorationImage(
              //               fit: BoxFit.cover,
              //               image: AssetImage('assets/images/three.jpg')),
              //         ),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: LinearGradient(
              //                 begin: Alignment.bottomRight,
              //                 stops: [
              //                   0.3,
              //                   0.9
              //                 ],
              //                 colors: [
              //                   Colors.black.withOpacity(.8),
              //                   Colors.black.withOpacity(.2)
              //                 ]),
              //           ),
              //           child: Align(
              //             alignment: Alignment.bottomLeft,
              //             child: Padding(
              //               padding: const EdgeInsets.all(15.0),
              //               child: Text(
              //                 'Best Design',
              //                 style:
              //                     TextStyle(color: Colors.white, fontSize: 20),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
    }
    );

    // return Scaffold(
    //   // backgroundColor: Colors.grey.shade300,
    //   appBar: AppBar(
    //     toolbarHeight: 100,
    //     backgroundColor: Colors.green.shade500,
    //     elevation: 0,
    //     leadingWidth: 200,
    //     leading: Container( 
    //       child: Row(
    //          children: [
    //           Row(
    //             children: [
    //               const Icon(Icons.location_on_outlined, size: 35),
          
    //               const SizedBox(width: 5,),
                    
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: const [
    //                   Text("Pincode", style: TextStyle(
    //                     fontSize: 16
    //                   )),
    //                   Text("000000", style: TextStyle(
    //                     fontSize: 16
    //                   ))
    //                 ],
    //               ),
              
    //               const SizedBox(width: 5,),
              
    //               IconButton(
    //                 onPressed: (){
    //                   Get.toNamed('/location');
    //                 }, 
    //                 icon: const Icon(Icons.expand_more)
    //               ),

    //               // Row(
    //               //   children: [
    //               //      SizedBox(
    //               //   child: TextFormField(),
    //               //   width: 300,
    //               // ),
    //               //   ],
    //               // )
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //     actions: [
    //       // Text("Add Product"),
    //       IconButton(
    //         onPressed: (){
    //           Get.toNamed('/addProduct');
    //         },
    //         iconSize: 30,
    //         icon: const Icon(Icons.add)
    //       ),
          
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       // TextButton(
    //       //   onPressed: (){
    //       //     if(Get.isDarkMode){
    //       //       theme.changeTheme(Themes.lightTheme);
    //       //       theme.saveTheme(false);
    //       //     }else{
    //       //       theme.changeTheme(Themes.darkTheme);
    //       //       theme.saveTheme(true);
    //       //     }
    //       //   }, 
    //       //   child: const Text("Change Theme")
    //       // ),
    //       Expanded(
    //         // child: Text("Hello"),
    //         child: GetX<ProductController>(
    //           builder: (controller){
    //              if(controller.isloading.value){
    //             return Center(child: CircularProgressIndicator(
    //               color: Colors.green.shade500,
    //             ));
    //           }else{
    //             return ListView.builder(
    //               itemCount: controller.productList.length,
    //               itemBuilder: (context, index){
    //                 print("Helooooooo");
    //                 print(controller.productList[index]);
    //                 return Text(controller.productList[index].productQuantity.toString(), style: TextStyle(
    //                   color: Colors.blueAccent
    //                 ),);
    //                 // return productTile(products.productList[index]);
    //               },
    //               // scrollDirection: Axis.horizontal,
    //             );
    //           }
    //           }
    //         )
    //       )
    //     ],
    //   ),
    // );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
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