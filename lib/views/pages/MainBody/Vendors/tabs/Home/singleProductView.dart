
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/bidController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/views/widgets/DropDownBidVendor.dart';

class SingleProductView extends StatefulWidget {
  SingleProductView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController bidController = new TextEditingController();

  final ProductController productController = Get.find();
  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  final int initialBidAmount = 2000;
  final int productQuantity = 20;
  double actualPrice = 0.0;
  BidController bidController =  Get.put(BidController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/two.jpg"),
            ),
            // buttonArrow(),
            scroll()
          ],
        ),
      )
    );
  }

  buttonArrow(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: (){
          // To go back
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.green,),
          ),
        )
        ),
      ),
    );
  }


  scroll(){
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 1.0,
      minChildSize: 0.75,
      builder: (context, scrollController){
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            border: Border.all(
              color: Colors.green.shade800,
              width: 2
            )
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(5), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 300,
                      child: Text(
                        "Kanda(Mumbai)", 
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 28,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12  ),
                    child: Text("Expiry Date: 2023-12-01"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Quantity - 12 kg",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(6),
                          child: Row(
                            children: [
                              Text(
                                "Price - "+"2000"+"/Kg ",   
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white 
                                ),
                              ),Icon(Icons.currency_rupee,size: 15 ,color: Colors.white) 
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Container(width: 200  ,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(6),
                            child: Row(
                              children: [Icon(Icons.location_pin,color: Colors.redAccent,),  
                                Text(" Distance: "+"600"+" km" ,style: TextStyle(color: Colors.white),),
                              ],
                            ),  
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 4,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("Description", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
                    child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 60,minHeight: 50),  
                      child: SingleChildScrollView(
                        child: Text("This isis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodis goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is goodhis is good", style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14
                           ),),
                      ),
                    ),
                  ), 
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 4,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Column(
                      children: [
                        Text("Your Bids", style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          'Latest',
                          'Highest Qty',
                          'Highest Price',
                        ]
                            .map((e) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      if (e == "Latest") {
                                        bidController.getListOfBidsForSpecificProduct(
                                            tokenId: bidController.productTokenId,filter: "latest");
                                      } else if (e == "Highest Qty") {
                                   bidController.getListOfBidsForSpecificProduct(
                                            tokenId: bidController.productTokenId,filter: "highestQuantity");
                                      } else if (e == "Highest Price") {
                                      bidController.getListOfBidsForSpecificProduct(
                                            tokenId: bidController.productTokenId,filter: "highestPrice");
                                      }
                                    },
                                    style: ButtonStyle(
                                        // border: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(30)),
                                        ),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                      ],
                    ),
                  ),
                
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return bidlist();
                    }
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }


  bidlist(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: BidDropDown(),
    );
  }
}


