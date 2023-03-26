import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/views/widgets/myList.dart';

class Body extends StatelessWidget {
  HomeController homeController = Get.find();
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    print(productController.productList.length);
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      if (homeController.isLoading.value) {
        print(homeController.isLoading.value);
        print("homeController.isLoading.value");
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
           print(homeController.isLoading.value);
        print("homeController.isLoading.value");
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: AppConstant.kPrimaryColor,
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
                      color: AppConstant.kPrimaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ",
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
                // Container(
                //     height: 200,
                    // child: CustomScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   controller: scrollController,
                    //   slivers: [
                    //     Text("Hello")
                    //   ],
                    // )
                    // child: PageView.builder(
                    //     // controller: scrollController,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) {
                    //       return myCard();
                    //     })),

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
                                    Get.toNamed('/singleProducePage'); 
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
    }
    );
  }
}

