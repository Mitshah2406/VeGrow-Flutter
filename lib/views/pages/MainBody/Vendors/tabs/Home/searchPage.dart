import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vegrow/consts/appConstant.dart';

class SearchPageForVendor extends StatefulWidget {
  const SearchPageForVendor({super.key});

  @override
  State<SearchPageForVendor> createState() => _SearchPageForVendorState();
}

class _SearchPageForVendorState extends State<SearchPageForVendor> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            // child: Obx((){
              // if(product.isloading.value)
                // return Center(child: CircularProgressIndicator());
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                crossAxisCount: 2, 
                itemCount: 10,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                itemBuilder: (context, index){
                  // return Text(product.productList[index].title.toString());
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(AppConstant.illustration1),
                            height: 180,
                          ),
                          Text("Product Title", style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 4),
                          Text("Product Description", style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "12kg"
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Text("2000 rs"),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  );
                }, 
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1)
              ),
            // }
            // ),
          )
        ],
      ),
    );
  }
}