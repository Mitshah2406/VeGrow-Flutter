import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/themesController.dart';
import 'package:vegrow/themes/themes.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController products = Get.put(ProductController());
  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    print(products.productList.length);
    print(products.productList);

    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green.shade500,
        elevation: 0,
        leadingWidth: 200,
        leading: Container( 
          child: Row(
             children: [
              Row(
                children: [
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

                  // Row(
                  //   children: [
                  //      SizedBox(
                  //   child: TextFormField(),
                  //   width: 300,
                  // ),
                  //   ],
                  // )
                ],
              )
            ],
          ),
        ),
        actions: [
          // Text("Add Product"),
          IconButton(
            onPressed: (){
              Get.toNamed('/addProduct');
            },
            iconSize: 30,
            icon: const Icon(Icons.add)
          ),
          
        ],
      ),
      body: Column(
        children: [
          // TextButton(
          //   onPressed: (){
          //     if(Get.isDarkMode){
          //       theme.changeTheme(Themes.lightTheme);
          //       theme.saveTheme(false);
          //     }else{
          //       theme.changeTheme(Themes.darkTheme);
          //       theme.saveTheme(true);
          //     }
          //   }, 
          //   child: const Text("Change Theme")
          // ),
          Expanded(
            // child: Text("Hello"),
            child: GetX<ProductController>(
              builder: (controller){
                 if(controller.isloading.value){
                return Center(child: CircularProgressIndicator(
                  color: Colors.green.shade500,
                ));
              }else{
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index){
                    print("Helooooooo");
                    print(controller.productList[index]);
                    return Text(controller.productList[index].productQuantity.toString(), style: TextStyle(
                      color: Colors.blueAccent
                    ),);
                    // return productTile(products.productList[index]);
                  },
                  // scrollDirection: Axis.horizontal,
                );
              }
              }
            )
          )
        ],
      ),
    );
  }
}