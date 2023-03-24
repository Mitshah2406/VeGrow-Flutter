import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/Orders/singleOrderPage.dart';
import 'package:vegrow/views/widgets/myList.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if(controller.position.maxScrollExtent == controller.offset){
        // Fetch More data
        fetch();
      }
    });
  }
  void fetch(){

  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Page"),
        // leading: IconButton(
        //   onPressed: (){
        //      Get.toNamed('/dashboard'); 
        //   }, 
        //   icon: const Icon(Icons.arrow_back_ios)
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          controller: controller,
          itemCount: 50 + 1,
          itemBuilder: (context, index){
            if(index < 50){
              return Container(
                margin: const EdgeInsets.only(top: 10),
                child: myList(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                        return SingleOrderPage();
                    }));
                  },
                ),
              );
            }else{
              return const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
        ),
      ),
    );
  }
}
