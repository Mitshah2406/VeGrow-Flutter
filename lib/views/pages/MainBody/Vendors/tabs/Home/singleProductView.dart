
// import 'dart:ffi';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:vegrow/controllers/bidController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/controllers/singleProductView.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/views/widgets/DropDownBidVendor.dart';
import 'package:vegrow/views/widgets/addProductTextField.dart';

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
  TextEditingController priceController=TextEditingController();
    TextEditingController qunatityController=TextEditingController();
  SpecificProductDetailController detailsController=Get.put(SpecificProductDetailController());
var  data;
  @override
  void initState() { 
detailsController.getDataForSpecifiProductFromId(data: Get.arguments['productId']);print("PPPPPPPPP");

    //  bidController.getListOfBidsForSpecificProduct(tokenId:detailsController.productDetail[0]['inventoryId'],filter: "All" );
    
  }  

  @override
  Widget build(BuildContext context) {
    print(Get.arguments['produtName']);
    return SafeArea(
      child: Scaffold(
        body: Obx(()=> detailsController.isLoadng==true ?Center(child: CircularProgressIndicator(),):
         Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/two.jpg"),
              ),
              // buttonArrow(),
              scroll()
            ],
          ),
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
                      width: 600,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        Text(detailsController.productDetail[0]['productName'],
                          
                          style: TextStyle(
                            color: Colors.blue.shade500,    
                            fontSize: 28,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                              showModalBottomSheet(isScrollControlled: true,
                context: context,
                builder: (BuildContext context,) {
                  return StatefulBuilder(builder: (context, StateSetter setState) {
                    return Container(
                        height: 400,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                child: Text(
                                  "Place A Bid",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 24),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: TextFormField(onChanged: (value) {print(detailsController.productDetail[0]['initialBidPrice']*10);
                                  priceController.text=  (int.parse(value) * double.parse(detailsController.productDetail[0]['initialBidPrice'])).toString();
                                setState(() {
                                  
                                });
                                  
                                },controller: qunatityController,
                                  keyboardType: TextInputType.number,
                                  // controller: priceController,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.green.shade300),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: "Quantity",
                                      prefixIcon: Icon(
                                          Icons
                                              .production_quantity_limits_outlined,
                                          color: Colors.black54),
                                      border: const OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green.shade300),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Colors.green, fontSize: 18),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red, fontSize: 14)),
                                  validator: (value) {
                                    if (value == "") {
                                      return "Enter Proper Details..";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: TextFormField(onChanged: (value) {
                                  
                                },
                                readOnly: true,
                                  keyboardType: TextInputType.number,
                                  controller: priceController,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.green.shade300),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: "Price",
                                      prefixIcon: Icon(
                                          Icons
                                              .production_quantity_limits_outlined,
                                          color: Colors.black54),
                                      border: const OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green.shade300),
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Colors.green, fontSize: 18),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Colors.red, fontSize: 14)),
                                  validator: (value) {
                                    if (value == "") {
                                      return "Enter Proper Details..";
                                    }
                                  },
                                ),
                              ),
                             
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    onPressed: ()async{
                                      
                                      
                                     var res= await productServices.bidOnProduct(bidAmount: priceController.text,bidQunatity:qunatityController.text,inventoryId: detailsController.productDetail[0]['inventoryId']); 
                                                                       Fluttertoast.showToast(msg: res);
                                     },


                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        "Place Bid",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ));
                  },
                  
                  );
                });
                          },
                          child: Text("Bid")
                        )
                      ]
                      ),  
                    ),
                  ),Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12  ),
                    child: Text("Expiry Date: "+detailsController.productDetail[0]['productExpiryDate'].toString()),
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
                            "Quantity - "+detailsController.productDetail[0]['productQuantityLeftInInventory'].toString()+" kg",
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
                                "Price - "+detailsController.productDetail[0]['initialBidPrice'].toString()+"/Kg ",   
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
                                Text(" Distance: "+detailsController.productDetail[0]['distance'].toString()+" km" ,style: TextStyle(color: Colors.white),),
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
                        child: Text(detailsController.productDetail[0]['productDescription'].toString(), style: TextStyle(
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
                
                  Obx(()=> bidController.isLoadng==true ? Center(child: CircularProgressIndicator(),):
                    Column(
                      children: bidController.bidList
                          .map(
                            (e) => GestureDetector(
                              onTap: () => {
                                // Get.toNamed('/singleProducePage/', arguments: {
                                //   "id": e.inventoryId,
                                // })
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       color: Theme.of(context).primaryColor,
                                  //       blurRadius: 10,
                                  //       spreadRadius: 3,
                                  //       offset: Offset(3, 4))
                                  // ],
                                ),
                                child: Hero(
                                  tag: bidController.bidList
                                      .map((element) => element.bidId),
                                  child: ListTile(
                                    
                                    contentPadding: const EdgeInsets.all(8),
                                    leading: ClipOval(
                                      child: Image.network(
                                        'https://static.vecteezy.com/system/resources/thumbnails/001/992/951/small/fresh-onion-healthy-vegetable-icon-free-vector.jpg',
                                        fit: BoxFit.cover,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                    title: Text(
                                      e.vendorName.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("\₹ " +
                                            e.bidQuantity.toString()),
                                        const SizedBox(height: 10),
                                        Container(
                                          height: 40,
                                          child: Stack(
                                            children: <Widget>[Text("Qunatity: "+e.bidQuantity.toString()+"kg")
                                              
                                              // const Positioned(
                                              //   left: 0,
                                              //   bottom: 0,
                                              //   child: CircleAvatar(
                                              //       child: Text('a')),
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
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


