import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/homeBody.dart';
import 'package:vegrow/views/widgets/myBottomNavBar.dart';

class vendorHomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(homeController.farmerList.length);
    return Obx((){
      if(homeController.isLoading.value){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else{
        return Scaffold(
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
                              homeController.farmerList[0].containsKey('location')
                                  ? homeController.farmerList[0]['location']
                                          ['sublocality']
                                      .toString()
                                  : "Add location",
                              style: const TextStyle(fontSize: 16)),
                          Text(
                              homeController.farmerList[0].containsKey('location')
                                  ? homeController.farmerList[0]['location']
                                          ['pinCode']
                                      .toString()
                                  : "000000",
                              style: const TextStyle(fontSize: 16))
                          // Text("Add Location"),
                          // Text("Pincode")
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
          body: Body(),
          bottomNavigationBar: MyBottomNavBar(),
        );
      }
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
