import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegrow/services/homeServices.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

import '../models/bid.dart';

class BidController extends GetxController {
  var isLoadng=true.obs;
var bidList=<Bid>[].obs;
var productTokenId="".obs;
var bidListEmpty=false.obs;
  late List<Bid> AllList;


  @override
  void onInit() {
  

    super.onInit();
    // fetchProduct();
  }
   void getListOfBidsForSpecificProduct({tokenId,filter})async{
    var bid=await productServices.getListOfBidsForSpecificProduct(tokenId: tokenId,filter: filter);
    if(bid!=null){
      bidList.value=bid;
      if (bidList.isEmpty){
        bidListEmpty(true);
      }else{
        bidListEmpty(false);
      }
    }


  } 

 
}
